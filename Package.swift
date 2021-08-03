// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "Obfuscation",
        products: [
            .library(name: "Obfuscation", targets: ["Obfuscation"]),
        ],
        targets: [
            .target(name: "Obfuscation", dependencies: [], path: "Sources"),
            .testTarget(name: "ObfuscationTests", dependencies: ["Obfuscation"]),
        ]
)
