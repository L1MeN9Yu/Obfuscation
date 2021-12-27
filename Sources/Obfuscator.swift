//
// Created by Mengyu Li on 2020/7/2.
//

import Foundation

public struct Obfuscator {
    /// The salt used to obfuscate and reveal the string.
    private let salt: [UInt8]

    public init(salt: [UInt8]) { self.salt = salt }

    public init(salt: String) { self.salt = [UInt8](salt.utf8) }
}

public extension Obfuscator {
    func operate(of input: [UInt8]) -> [UInt8] {
        input.enumerated().reduce(into: [UInt8]()) { (result: inout [UInt8], tuple: (offset: Int, element: UInt8)) in
            result.append(tuple.element ^ salt[tuple.offset % salt.count])
        }
    }
}

public extension Obfuscator {
    /**
      This method obfuscates the string passed in using the salt
      that was used when the Obfuscator was initialized.

      - parameter string: the string to obfuscate
      - returns: the obfuscated string in a byte array
     */
    func bytes(of string: String) -> [UInt8] {
        operate(of: [UInt8](string.utf8))
    }

    /**
     This method reveals the original string from the obfuscated
     byte array passed in. The salt must be the same as the one
     used to encrypt it in the first place.

     - parameter key: the byte array to reveal
     - returns: the original string
     */
    func string(of bytes: [UInt8], encoding: String.Encoding = .utf8) -> String? {
        String(bytes: operate(of: bytes), encoding: encoding)
    }
}
