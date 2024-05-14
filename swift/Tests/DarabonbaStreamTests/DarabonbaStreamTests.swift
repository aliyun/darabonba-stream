import Foundation
import XCTest
@testable import DarabonbaStream

final class DarabonbaStreamTests: XCTestCase {
    
    func testReadFromFilePath() throws {
        let inputStream = Client.readFromFilePath(nil)
        XCTAssertFalse(inputStream.hasBytesAvailable)
        inputStream.close()
    }
    
    func testReadFromBytes() {
        let bytes: [UInt8] = [0x01, 0x02, 0x03]
        let inputStream = Client.readFromBytes(bytes)
        var readData = Data()
        readData = Data(reading: inputStream)
        XCTAssertEqual(readData, Data(bytes))
        inputStream.close()
    }
    
    func testReadFromString() {
        let validString = "test text"
        let inputStream = Client.readFromString(validString)
        let readData = Data(reading: inputStream)
        inputStream.close()
        
        XCTAssertEqual(readData, validString.data(using: .utf8))
    }
}

extension Data {
    init(reading inputStream: InputStream) {
        self.init()
        let bufferSize = 256
        var buffer = [UInt8](repeating: 0, count: bufferSize)
        while inputStream.hasBytesAvailable {
            let read = inputStream.read(&buffer, maxLength: bufferSize)
            if read > 0 {
                self.append(buffer, count: read)
            } else if read < 0 {
                break
            }
        }
    }
}

