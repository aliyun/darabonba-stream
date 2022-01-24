// This file is auto-generated, don't edit it
/**
 * This is a stream module
 */
import { Readable } from 'stream';
import * as $tea from '@alicloud/tea-typescript';
import { createReadStream } from 'fs';

class BytesReadable extends Readable {
  value: Buffer

  constructor(value: string | Buffer) {
    super();
    if (typeof value === 'string') {
      this.value = Buffer.from(value);
    } else if (Buffer.isBuffer(value)) {
      this.value = value;
    }
  }

  _read() {
    this.push(this.value);
    this.push(null);
  }
}
export default class Client {

  static readFromFilePath(path: string): Readable {
    return createReadStream(path);
  }

  static readFromBytes(raw: Buffer): Readable {
    return new BytesReadable(raw);
  }

  static readFromString(raw: string): Readable {
    return new BytesReadable(raw);
    return
  }

  static reset(raw: any): void {
    if (!raw.path) {
      throw new Error('Only file streams are supported')
    }
    raw = createReadStream(raw.path)
  }

}
