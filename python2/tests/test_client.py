import unittest
import os

from alibabacloud_darabonba_stream.client import Client

base_path = os.path.dirname(__file__)


class TestClient(unittest.TestCase):

    def test_read_from_file_path(self):
        result = Client.read_from_file_path(base_path + "/test.txt")
        self.assertEqual(b'test', result.read(100))

    def test_read_from_bytes(self):
        result = Client.read_from_bytes(b'test')
        self.assertEqual(b'test', result.read(100))

    def test_read_from_string(self):
        result = Client.read_from_string('test')
        self.assertEqual(b'test', result.read(100))
