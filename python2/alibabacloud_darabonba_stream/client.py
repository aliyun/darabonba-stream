# -*- coding: utf-8 -*-
# This file is auto-generated, don't edit it. Thanks.
from io import BytesIO

class Client(object):
    """
    This is a stream module
    """
    def __init__(self):
        pass

    @staticmethod
    def read_from_file_path(path):
        return open(path, 'rb')

    @staticmethod
    def read_from_bytes(raw):
        f = BytesIO()
        f.write(raw)
        f.seek(0)
        return f

    @staticmethod
    def read_from_string(raw):
        return Client.read_from_bytes(bytes(raw, 'utf-8'))

    @staticmethod
    def reset(raw):
        raise Exception('Un-implemented')
