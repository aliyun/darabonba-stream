// This file is auto-generated, don't edit it. Thanks.
package com.aliyun.darabonba.stream;

import com.aliyun.tea.*;

import java.io.*;

public class Client {

    public static InputStream readFromFilePath(String path) throws Exception {
        File file = new File(path);
        return new FileInputStream(file);
    }

    public static InputStream readFromBytes(byte[] raw) {
        return new ByteArrayInputStream(raw);
    }

    public static InputStream readFromString(String raw) throws Exception {
        return new ByteArrayInputStream(raw.getBytes("UTF-8"));
    }

    public static void reset(InputStream raw) throws Exception {
        if (raw.markSupported()) {
            raw.reset();
        } else {
            throw new IllegalArgumentException("Do not support reset");
        }
    }
}
