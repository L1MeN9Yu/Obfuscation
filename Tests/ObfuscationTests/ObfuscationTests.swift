import XCTest
@testable import Obfuscation
import ObjectiveC
import Darwin

final class ObfuscationTests: XCTestCase {
    func testObfuscator() {
        let salt = String(UInt64.random(in: 0..<UInt64.max))
        let value = UInt64.random(in: 0..<UInt64.max)
        let string = String(value)
        let obfuscator = Obfuscator(salt: salt)
        let array = obfuscator.bytes(of: string)
        let result = obfuscator.string(of: array)
        XCTAssertEqual(result, string)
    }

    static var allTests = [
        ("testObfuscator", testObfuscator),
    ]
}
