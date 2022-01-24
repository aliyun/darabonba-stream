<?php

// This file is auto-generated, don't edit it. Thanks.
namespace AlibabaCloud\Darabonba\Stream;

use GuzzleHttp\Psr7\Stream;
use \Exception;

/**
 * This is a stream module
 */
class StreamUtil {

    /**
     * @param string $path
     * @return Stream
     */
    public static function readFromFilePath($path){
        return new Stream(fopen($path, 'r'));
    }

    /**
     * @param int[] $raw
     * @return Stream
     */
    public static function readFromBytes($raw){
        $str = '';
        foreach ($raw as $ch) {
            $str .= \chr($ch);
        }
        return self::readFromString($str);
    }

    /**
     * @param string $raw
     * @return Stream
     */
    public static function readFromString($raw){
        $stream = new Stream();
        $stream.write($raw);
        return $stream;
    }

    /**
     * @param Stream $raw
     * @return void
     */
    public static function reset($raw){
        if ($raw->isSeekable()) {
            $raw->rewind();
        } else {
            throw new \InvalidArgumentException('Do not support reset');
        }
    }
}
