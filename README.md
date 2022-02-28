# Obfuscation

An obfuscation library for protecting your literal strings.

## Status

[![Build](https://github.com/L1MeN9Yu/Obfuscation/actions/workflows/build.yml/badge.svg)](https://github.com/L1MeN9Yu/Obfuscation/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/L1MeN9Yu/Obfuscation/branch/main/graph/badge.svg?token=23M2GU9V2X)](https://codecov.io/gh/L1MeN9Yu/Obfuscation)

## Usage

```swift
import Obfuscation

let salt = String(describing: Int.self)
let obfuscator = Obfuscator(salt: salt)
let string = "your literal string"
// or avoid using literal string
let string = "".y.o.u.r.space.l.i.t.e.r.a.l.space.s.t.r.i.n.g
let bytes = obfuscator.bytes(of: string)
let runtimeString = obfuscator.string(of: bytes)
```

## Install

### Swift Package

To use the `Obfuscation` library in a SwiftPM project, add the following line to the dependencies in your Package.swift file:

```swift
.package(url: "https://github.com/L1MeN9Yu/Obfuscation.git", from: "1.4.0")
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

## Code Coverage

![sunburst](https://codecov.io/gh/L1MeN9Yu/Obfuscation/branch/main/graphs/sunburst.svg)
