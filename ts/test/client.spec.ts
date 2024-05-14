import Client from '../src/client';
import { Readable } from 'stream';
import assert from 'assert';
import path from 'path';
import 'mocha';

function read(readable: Readable): Promise<Buffer> {
  return new Promise((resolve, reject) => {
    let onData, onError, onEnd;
    var cleanup = function () {
      // cleanup
      readable.removeListener('error', onError);
      readable.removeListener('data', onData);
      readable.removeListener('end', onEnd);
    };

    var bufs = [];
    var size = 0;

    onData = function (buf) {
      bufs.push(buf);
      size += buf.length;
    };

    onError = function (err) {
      cleanup();
      reject(err);
    };

    onEnd = function () {
      cleanup();
      resolve(Buffer.concat(bufs, size));
    };

    readable.on('error', onError);
    readable.on('data', onData);
    readable.on('end', onEnd);
  });
}

describe('Tea Util', function () {
  it('Module should ok', function () {
    assert.ok(Client);
  });

  it('readFromFilePath should ok', async function () {
    const res = Client.readFromFilePath(path.join(__dirname, 'test.txt'));
    assert.deepStrictEqual((await read(res)).toString(), 'test');
  });

  it('readFromBytes should ok', async function () {
    const res = Client.readFromBytes(Buffer.from('test'));
    assert.deepStrictEqual((await read(res)).toString(), 'test');
  });

  it('readFromString should ok', async function () {
    const res = Client.readFromString('test');
    assert.deepStrictEqual((await read(res)).toString(), 'test');
  });
});
