@testable import Obfuscation
import XCTest

final class ObfuscationTests: XCTestCase {
    func testObfuscator() {
        let salt = String(UInt64.random(in: 0..<UInt64.max))
        let value = UInt64.random(in: 0..<UInt64.max)
        let string = String(value)
        let obfuscator = Obfuscator(salt: salt)
        let array = obfuscator.bytes(of: string)
        guard let result = obfuscator.string(of: array) else {
            return XCTFail()
        }
        XCTAssertEqual(result, string)
    }
}
