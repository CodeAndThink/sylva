# Jenkins → Google Play Internal testing

## Flow

This pipeline targets the existing Jenkins installation on the local Mac and
`https://github.com/CodeAndThink/sylva.git`, branch `main`.
Jenkins polls SCM every minute. It then samples the remote main SHA every 30
seconds until it has remained unchanged for 300 seconds. Each detected change
restarts the timer. This normally starts work about 5–6 minutes after the latest
merge; agent availability, sleep and connectivity can delay it further.
Direct pushes also trigger the pipeline. Use GitHub branch protection if changes
must exclusively arrive through pull requests.

Only one run executes at a time. Queued runs skip publishing if the latest
successful run already published the same SHA (recorded in its build description;
do not edit those descriptions). If main changes during the build, that run fails
the pre-upload check; a subsequent SCM run builds the newer commit. A change
after the final check can still overlap an upload already in progress.
The manual Build Now button uses the same wait and upload flow.

## Credentials

In Manage Jenkins → Credentials → System → Global credentials, create:

| ID | Kind | Value |
| --- | --- | --- |
| `sylva-google-play-json` | Secret file | Service account JSON with Sylva testing release permissions |
| `sylva-upload-keystore` | Secret file | Existing `android/upload-keystore.jks` |
| `sylva-key-alias` | Secret text | Existing `keyAlias` |
| `sylva-key-password` | Secret text | Existing `keyPassword` |
| `sylva-store-password` | Secret text | Existing `storePassword` |

`android/app/google-services.json` is already tracked in this repository.
Signing configuration is generated with restricted permissions, references the
credential file directly, and is removed after the build. Missing signing
credentials fail the pipeline before Flutter can fall back to debug signing.

## Agent requirements

- Jenkins built-in node on this Mac, with at least one executor. Do not configure
  its custom workspace to point to your development checkout: the job cleans its
  own workspace before checkout.
- Plugins: Pipeline (including Declarative), Git, Credentials Binding.
- Flutter 3.41.6: `/Users/admin/fvm/versions/3.41.6`.
- Build JDK 17: `/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home`.
  Jenkins itself can continue running on its own Java 21.
- Android SDK: `/Users/admin/Library/Android/sdk`, with Android licenses accepted.
- Homebrew Ruby/Bundler on PATH, Python 3 and Git.
- Mac must be awake and online. No public Jenkins URL or webhook is required.

Machine-specific paths are set near the top of `Jenkinsfile`.

## Create the job (after these files are merged into main)

1. New Item → `sylva-internal` → Pipeline.
2. Pipeline definition: Pipeline script from SCM; SCM: Git.
3. URL: `https://github.com/CodeAndThink/sylva.git`. Leave Git credentials empty.
4. Branch Specifier: `*/main`; Script Path: `Jenkinsfile`.
5. Save and run Build Now once to load the pipeline and register polling.
6. Inspect each stage and confirm the release on Play Console → Internal testing.

The first run requires all six credentials above. Build Now performs a real
upload after validation and a successful signed build. An AAB is archived before
upload, so it remains downloadable even if Google rejects the release.

## Versioning and failures

The version name stays in `pubspec.yaml`. The build number is the greater of:

- pubspec build number + Jenkins BUILD_NUMBER (currently 24 + job build number);
- largest version code on the standard Play tracks + 1.

For an initial Jenkins run with no Play release above 24, this produces 25.
Version lookup errors stop the build. Runs are serialized, but external/manual
uploads can race with Jenkins. Custom tracks or previously uploaded, unassigned
bundles can also hold higher version codes; raise the pubspec build floor above
those codes when necessary and rerun. Never automatically retry an upload with
the same version code after an ambiguous API error; inspect Play first.

Only track `internal` is written, with release status `completed`. Store metadata,
screenshots and other release tracks are not modified. Play Console policy or
review requirements can still prevent availability to testers.

## Local verification (no upload)

```sh
python3 -m unittest discover -s scripts/ci -p 'test_*.py'
ruby -c fastlane/Fastfile
ruby -c fastlane/Appfile
BUNDLE_PATH=vendor/bundle bundle install
BUNDLE_PATH=vendor/bundle FASTLANE_OPT_OUT_USAGE=1 bundle exec fastlane lanes
git diff --check
```

The existing GitHub Actions workflow is independent and remains enabled; it may
also build an APK and create a GitHub release on main.
