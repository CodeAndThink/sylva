"""Small Jenkins helpers. Credentials are read from the environment, never logged."""
import os
from pathlib import Path
import subprocess
import sys
import time


def property_value(value):
    escapes = {'\\': '\\\\', '\n': '\\n', '\r': '\\r', '\t': '\\t',
               '=': '\\=', ':': '\\:', ' ': '\\ ', '#': '\\#', '!': '\\!'}
    # Java Properties.load(InputStream) reads Latin-1 and UTF-16 unicode escapes.
    result = []
    for char in value:
        if char in escapes:
            result.append(escapes[char])
        elif ord(char) > 126:
            encoded = char.encode('utf-16-be')
            result.extend('\\u' + encoded[i:i + 2].hex() for i in range(0, len(encoded), 2))
        else:
            result.append(char)
    return ''.join(result)


def write_signing(android_dir, environment):
    names = {'storeFile': 'UPLOAD_KEYSTORE', 'keyAlias': 'KEY_ALIAS',
             'keyPassword': 'KEY_PASSWORD', 'storePassword': 'STORE_PASSWORD'}
    if any(not environment.get(name) for name in names.values()):
        raise ValueError('Missing Jenkins signing credential')
    if not Path(environment['UPLOAD_KEYSTORE']).is_file():
        raise ValueError('Upload keystore is missing')
    target = android_dir / 'key.properties'
    fd = os.open(target, os.O_WRONLY | os.O_CREAT | os.O_TRUNC, 0o600)
    os.fchmod(fd, 0o600)
    with os.fdopen(fd, 'w', encoding='ascii') as stream:
        for key, name in names.items():
            stream.write(key + '=' + property_value(environment[name]) + '\n')


def remote_head():
    line = subprocess.check_output(
        ['git', 'ls-remote', '--exit-code', 'origin', 'refs/heads/main'],
        text=True, timeout=30).strip()
    return line.split()[0]


def wait_for_stable_head(head=remote_head, now=time.monotonic, sleep=time.sleep):
    current = head()
    stable_since = now()
    while True:
        sleep(30)
        latest = head()
        if latest != current:
            current, stable_since = latest, now()
            print('main changed; restarting the five-minute wait.', flush=True)
        if now() - stable_since >= 300:
            return current


if __name__ == '__main__':
    command = sys.argv[1]
    if command == 'signing':
        write_signing(Path('android'), os.environ)
    elif command == 'wait':
        commit = wait_for_stable_head()
        subprocess.run(['git', 'fetch', 'origin', 'main'], check=True)
        subprocess.run(['git', 'checkout', '--detach', commit], check=True)
        print('Building main commit ' + commit)
    elif command == 'check-head':
        local = subprocess.check_output(['git', 'rev-parse', 'HEAD'], text=True).strip()
        if local != remote_head():
            raise SystemExit('main changed during build. Skipping upload; the next SCM run builds the new commit.')
    else:
        raise SystemExit('Unknown command')
