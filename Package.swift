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
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.1/VSCCommon.xcframework.zip",
            checksum: "bfc35e17772e458ff86af42c843dcf4130e71af221efeb5497d3e15068c0097d"
        ),

        .binaryTarget(
            name: "VSCFoundation",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.1/VSCFoundation.xcframework.zip",
            checksum: "d6349eb82a8478d00bc62b40f30f341553ab72e771f1316a1c32193a339c7faa"
        ),

        .binaryTarget(
            name: "VSCPythia",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.1/VSCPythia.xcframework.zip",
            checksum: "b76319840a7c67303821ca4324965a6782d3d8f6ae5d108261c32f3139887e6c"
        ),

        .binaryTarget(
            name: "VSCRatchet",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.1/VSCRatchet.xcframework.zip",
            checksum: "ff3a3c6677eec624772936dff7f4243787d1122811f8a1ecb76f41050d2e7ee5"
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
