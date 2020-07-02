import XCTest
@testable import Obfuscation
import ObjectiveC
import Darwin

final class ObfuscationTests: XCTestCase {
    func testDefaultObfuscator() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let value = UInt64.random(in: 0..<UInt64.max)
        let string = String(value)
        let obfuscator = Obfuscator()
        let array = obfuscator.bytes(of: string)
        let result = obfuscator.string(of: array)
        XCTAssert(result == string)
    }

    func testCustomObfuscator() {
        let salt = String(UInt64.random(in: 0..<UInt64.max))
        let value = UInt64.random(in: 0..<UInt64.max)
        let string = String(value)
        let obfuscator = Obfuscator(salt: salt)
        let array = obfuscator.bytes(of: string)
        let result = obfuscator.string(of: array)
        XCTAssert(result == string)
    }

    func testRegisterSalt() {
        Obfuscator.register(defaultSalt: [
            NSObject.self,
            Int.self,
            type(of: Darwin.dlopen)
        ])
        let value = UInt64.random(in: 0..<UInt64.max)
        let string = String(value)
        let obfuscator = Obfuscator()
        let array = obfuscator.bytes(of: string)
        let result = obfuscator.string(of: array)
        XCTAssert(result == string)
    }

    static var allTests = [
        ("testDefaultObfuscator", testDefaultObfuscator),
        ("testCustomObfuscator", testCustomObfuscator),
        ("testRegisterSalt", testRegisterSalt),
    ]
}
