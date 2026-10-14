pipeline {
    agent { label 'built-in' }

    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
        timeout(time: 90, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '15', artifactNumToKeepStr: '5'))
        quietPeriod(0)
    }

    // The job's SCM must be restricted to */main. Pushes and merges both trigger it.
    triggers { pollSCM('* * * * *') }

    environment {
        FLUTTER_HOME = '/Users/admin/fvm/versions/3.41.6'
        JAVA_HOME = '/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home'
        ANDROID_HOME = '/Users/admin/Library/Android/sdk'
        PATH = "${FLUTTER_HOME}/bin:${JAVA_HOME}/bin:/opt/homebrew/opt/ruby/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin"
        BUNDLE_FROZEN = 'true'
        BUNDLE_PATH = "${WORKSPACE}/vendor/bundle"
        FASTLANE_SKIP_UPDATE_CHECK = '1'
        FASTLANE_HIDE_CHANGELOG = '1'
        FASTLANE_OPT_OUT_USAGE = '1'
        CI = 'true'
    }

    stages {
        stage('Checkout') {
            steps {
                // Only use this job's Jenkins workspace, never the developer checkout.
                deleteDir()
                checkout scm
            }
        }
        stage('Wait for main to settle') {
            steps {
                sh 'python3 scripts/ci/release.py wait'
                script {
                    env.RELEASE_COMMIT = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()
                    def published = "Published main ${env.RELEASE_COMMIT}"
                    env.SKIP_RELEASE = currentBuild.previousSuccessfulBuild?.description == published ? 'true' : 'false'
                    currentBuild.description = env.SKIP_RELEASE == 'true' ? published : "main ${env.RELEASE_COMMIT.take(8)}"
                    if (env.SKIP_RELEASE == 'true') {
                        echo 'This commit was already published successfully; skipping the duplicate run.'
                    }
                }
            }
        }
        stage('Build and publish') {
            when { expression { env.SKIP_RELEASE != 'true' } }
            stages {
                stage('Dependencies and generated code') {
                    steps {
                        sh '''
                            flutter --version
                            bundle install
                            flutter pub get --enforce-lockfile
                            dart run intl_utils:generate
                            dart run build_runner build --delete-conflicting-outputs
                        '''
                    }
                }
                stage('Check') {
                    steps {
                        sh '''
                            python3 -m unittest discover -s scripts/ci -p 'test_*.py'
                            flutter analyze
                            if [ -d test ]; then flutter test; fi
                        '''
                    }
                }
                stage('Version code') {
                    steps {
                        withCredentials([file(credentialsId: 'sylva-google-play-json', variable: 'PLAY_JSON')]) {
                            sh 'bundle exec fastlane android next_build_number'
                        }
                    }
                }
                stage('Signed Android bundle') {
                    steps {
                        withCredentials([
                            file(credentialsId: 'sylva-upload-keystore', variable: 'UPLOAD_KEYSTORE'),
                            string(credentialsId: 'sylva-key-alias', variable: 'KEY_ALIAS'),
                            string(credentialsId: 'sylva-key-password', variable: 'KEY_PASSWORD'),
                            string(credentialsId: 'sylva-store-password', variable: 'STORE_PASSWORD')
                        ]) {
                            sh '''
                                set +x
                                trap 'rm -f android/key.properties' EXIT
                                python3 scripts/ci/release.py signing
                                flutter build appbundle --release --build-number="$(cat .ci/build-number)"
                            '''
                        }
                        archiveArtifacts artifacts: 'build/app/outputs/bundle/release/app-release.aab', fingerprint: true
                    }
                }
                stage('Upload Internal testing') {
                    steps {
                        sh 'python3 scripts/ci/release.py check-head'
                        withCredentials([file(credentialsId: 'sylva-google-play-json', variable: 'PLAY_JSON')]) {
                            sh 'bundle exec fastlane android internal'
                        }
                        script { currentBuild.description = "Published main ${env.RELEASE_COMMIT}" }
                    }
                }
            }
        }
    }
    post {
        always {
            sh 'rm -f android/key.properties'
        }
    }
}
