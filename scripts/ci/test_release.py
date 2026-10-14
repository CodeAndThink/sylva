import importlib.util
import pathlib
import tempfile
import unittest

MODULE = pathlib.Path(__file__).with_name('release.py')


class ReleaseTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(MODULE.exists(), 'CI release helper must exist')
        spec = importlib.util.spec_from_file_location('release', MODULE)
        self.release = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(self.release)

    def test_properties_escape_passwords_and_unicode(self):
        self.assertEqual(self.release.property_value(' a\\b\n:=ế'),
                         '\\ a\\\\b\\n\\:\\=\\u1ebf')

    def test_missing_signing_secret_does_not_write_properties(self):
        with tempfile.TemporaryDirectory() as folder:
            with self.assertRaises(ValueError):
                self.release.write_signing(pathlib.Path(folder), {})
            self.assertFalse((pathlib.Path(folder) / 'key.properties').exists())

    def test_signing_file_uses_restricted_permissions_and_real_keystore_path(self):
        with tempfile.TemporaryDirectory() as folder:
            root = pathlib.Path(folder)
            key = root / 'upload key.jks'
            key.write_bytes(b'fixture')
            self.release.write_signing(root, {
                'UPLOAD_KEYSTORE': str(key), 'KEY_ALIAS': 'upload',
                'KEY_PASSWORD': 'secret', 'STORE_PASSWORD': 'secret',
            })
            result = root / 'key.properties'
            self.assertEqual(result.stat().st_mode & 0o777, 0o600)
            self.assertIn('storeFile=' + self.release.property_value(str(key)), result.read_text())

    def test_new_merge_restarts_full_five_minute_wait(self):
        clock = [0]
        def sleep(seconds):
            clock[0] += seconds
        def head():
            return 'first' if clock[0] < 180 else 'second'
        result = self.release.wait_for_stable_head(head, lambda: clock[0], sleep)
        self.assertEqual(result, 'second')
        self.assertEqual(clock[0], 480)

    def test_no_changes_waits_five_minutes(self):
        clock = [0]
        def sleep(seconds):
            clock[0] += seconds
        self.assertEqual(self.release.wait_for_stable_head(
            lambda: 'same', lambda: clock[0], sleep), 'same')
        self.assertEqual(clock[0], 300)

    def test_remote_failure_stops_release(self):
        def failed_remote():
            raise RuntimeError('network unavailable')
        with self.assertRaises(RuntimeError):
            self.release.wait_for_stable_head(failed_remote, lambda: 0, lambda _: None)


if __name__ == '__main__':
    unittest.main()
