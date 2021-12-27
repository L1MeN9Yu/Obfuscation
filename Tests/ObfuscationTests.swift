@testable import Obfuscation
import XCTest

final class ObfuscationTests: XCTestCase {
    func testObfuscator() {
        let salt = String(UInt64.random(in: 0..<UInt64.max))
        let value = UInt64.random(in: 0..<UInt64.max)
        let string = String(value)
        let obfuscator = Obfuscator(salt: [UInt8](salt.utf8))
        let array = obfuscator.bytes(of: string)
        guard let result = obfuscator.string(of: array) else {
            return XCTFail()
        }
        XCTAssertEqual(result, string)
    }

    func testObfuscators() {
        let salt = String(UInt64.random(in: 0..<UInt64.max))
        let obfuscatorByData = Obfuscator(salt: [UInt8](salt.utf8))
        let obfuscatorByString = Obfuscator(salt: salt)
        let input = String(UInt64.random(in: 0..<UInt64.max))
        XCTAssertEqual(obfuscatorByData.operate(of: [UInt8](input.utf8)), obfuscatorByString.operate(of: [UInt8](input.utf8)))
    }
}
