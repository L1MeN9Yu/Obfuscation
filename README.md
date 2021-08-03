# Obfuscation

An obfuscation library for protecting your literal strings.

## Usage

```swift
import Obfuscation

let salt = String(describing: Int.self)
let obfuscator = Obfuscator(salt: salt)
let bytes = obfuscator.bytes(of: "your literal string")
let runtimeString = obfuscator.string(of: bytes)
```

## Install 

### Swift Package

To use the `Obfuscation` library in a SwiftPM project, add the following line to the dependencies in your Package.swift file:

```swift
.package(url: "https://github.com/L1MeN9Yu/Obfuscation.git", from: "1.0.0"),
```

Finally, include "Obfuscation" as a dependency for your executable target:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        .package(url: "https://github.com/L1MeN9Yu/Obfuscation.git", from: "1.0.0"),
        // other dependencies
    ],
    targets: [
        .target(name: "<target>", dependencies: [
            .product(name: "Obfuscation", package: "Obfuscation"),
        ]),
        // other targets
    ]
)
```