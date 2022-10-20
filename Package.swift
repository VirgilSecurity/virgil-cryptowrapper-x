// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "VirgilCryptoWrapper",
    platforms: [
        .macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(
            name: "VirgilCryptoFoundation",
            targets: ["VirgilCryptoFoundation"]),

        .library(
            name: "VirgilCryptoPythia",
            targets: ["VirgilCryptoPythia"]),

        .library(
            name: "VirgilCryptoRatchet",
            targets: ["VirgilCryptoRatchet"]),

    ],
    targets: [
        //
        // VSCCrypto
        //
        .binaryTarget(
            name: "VSCCommon",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.2/VSCCommon.xcframework.zip",
            checksum: "821ef22ce9bfaf250a7c9ea1d2e02e7ea88b99483a204e4d98731a600ae5f4a7"
        ),

        .binaryTarget(
            name: "VSCFoundation",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.2/VSCFoundation.xcframework.zip",
            checksum: "7b0e66546707e59460af666f4a268990e13e5e8662526bd7c4a9c8d0a6fded72"
        ),

        .binaryTarget(
            name: "VSCPythia",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.2/VSCPythia.xcframework.zip",
            checksum: "c45a52299e319b9c80b834d7895f71a8383fe0e8a30c9b2a676f0d35d9205540"
        ),

        .binaryTarget(
            name: "VSCRatchet",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.2/VSCRatchet.xcframework.zip",
            checksum: "dd3c675527e3257a456433ebb3f1966f824033f38481863a0e06a1e25eb4eec0"
        ),

        //
        // VirgilCryptoFoundation
        //
        .target(
            name: "VirgilCryptoFoundation",
            dependencies: ["VSCCommon", "VSCFoundation"],
            path: "VirgilCryptoFoundation",
            exclude: ["Info.plist"]),

        .testTarget(
            name: "VirgilCryptoFoundationTests",
            dependencies: ["VirgilCryptoFoundation"],
            path: "VirgilCryptoFoundationTests",
            exclude: ["Info.plist"]),

        //
        // VirgilCryptoPythia
        //
        .target(
            name: "VirgilCryptoPythia",
            dependencies: ["VirgilCryptoFoundation", "VSCPythia"],
            path: "VirgilCryptoPythia",
            exclude: ["Info.plist"]),

        .testTarget(
            name: "VirgilCryptoPythiaTests",
            dependencies: ["VirgilCryptoPythia"],
            path: "VirgilCryptoPythiaTests",
            exclude: ["Info.plist"]),

        //
        // VirgilCryptoRatchet
        //
        .target(
            name: "VirgilCryptoRatchet",
            dependencies: ["VirgilCryptoFoundation", "VSCRatchet"],
            path: "VirgilCryptoRatchet",
            exclude: ["Info.plist"]),

        .testTarget(
            name: "VirgilCryptoRatchetTests",
            dependencies: ["VirgilCryptoRatchet"],
            path: "VirgilCryptoRatchetTests",
            exclude: ["Info.plist"]),
    ]
)
