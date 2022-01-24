/**
 * This is a stream module
 */
// This file is auto-generated, don't edit it. Thanks.

using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

using Tea;
using Tea.Utils;


namespace AlibabaCloud.DarabonbaStream
{
    public class StreamUtil 
    {

        public static Stream ReadFromFilePath(string path)
        {
            return new FileStream(path, FileMode.Open);
        }

        public static Stream ReadFromBytes(byte[] raw)
        {
            return new MemoryStream(raw);
        }

        public static Stream ReadFromString(string raw)
        {
            return ReadFromBytes(System.Text.Encoding.UTF8.GetBytes(raw));

        }

        public static void Reset(Stream raw)
        {
            throw new NotImplementedException();
        }

    }
}
