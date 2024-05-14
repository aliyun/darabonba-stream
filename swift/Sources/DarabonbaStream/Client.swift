import Foundation
import Tea

open class Client {
    public static func readFromFilePath(_ path: String?) -> InputStream {
        guard let path = path else {
            let inputStream = InputStream(data: Data())
            inputStream.open()
            return inputStream
        }
        
        let fileUrl = URL(fileURLWithPath: path)
        let inputStream = InputStream(url: fileUrl) ?? InputStream(data: Data())
        inputStream.open()
        return inputStream
    }
    
    public static func readFromBytes(_ raw: [UInt8]?) -> InputStream {
        guard let raw = raw else {
            let inputStream = InputStream(data: Data())
            inputStream.open()
            return inputStream
        }
        let inputStream = InputStream(data: Data(raw))
        inputStream.open()
        return inputStream
    }
    
    public static func readFromString(_ raw: String?) -> InputStream {
        guard let _raw = raw,
              let data = _raw.data(using: .utf8) else {
            let inputStream = InputStream(data: Data())
            inputStream.open()
            return inputStream
        }
        let inputStream = InputStream(data: data)
        inputStream.open()
        return inputStream
    }
    
    public static func reset(_ raw: InputStream?) -> Void {
        
    }
}
