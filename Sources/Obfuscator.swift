//
// Created by Mengyu Li on 2020/7/2.
//

import Foundation

public struct Obfuscator {
    /// The salt used to obfuscate and reveal the string.
    private let salt: String

    public init(salt: String) { self.salt = salt }
}

public extension Obfuscator {
    /**
     This method obfuscates the string passed in using the salt
     that was used when the Obfuscator was initialized.

     - parameter string: the string to obfuscate
     - returns: the obfuscated string in a byte array
    */
    func bytes(of string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let cipher = [UInt8](salt.utf8)
        let length = cipher.count

        var encrypted = [UInt8]()

        text.enumerated().forEach { (offset: Int, element: UInt8) in
            encrypted.append(element ^ cipher[offset % length])
        }
        return encrypted
    }

    /**
     This method reveals the original string from the obfuscated
     byte array passed in. The salt must be the same as the one
     used to encrypt it in the first place.

     - parameter key: the byte array to reveal
     - returns: the original string
     */
    func string(of bytes: [UInt8]) -> String {
        let cipher = [UInt8](salt.utf8)
        let length = cipher.count

        var decrypted = [UInt8]()

        bytes.enumerated().forEach { (offset: Int, element: UInt8) in
            decrypted.append(element ^ cipher[offset % length])
        }

        return String(bytes: decrypted, encoding: .utf8)!
    }
}
