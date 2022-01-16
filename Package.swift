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
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.0/VSCCommon.xcframework.zip",
            checksum: "5d0b6b30566c4207b7193975211cfaad875ec375311c5eb6c59a766042afe73f"
        ),

        .binaryTarget(
            name: "VSCFoundation",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.0/VSCFoundation.xcframework.zip",
            checksum: "d4cbf329eee3ad9d335e1238147f01c65bcf860fe13def3eb6d41f6997efc187"
        ),

        .binaryTarget(
            name: "VSCPythia",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.0/VSCPythia.xcframework.zip",
            checksum: "de2d55495ac91dfb638cf97c35e49cf22c9fde06e20b1b3466a926e79084f60c"
        ),

        .binaryTarget(
            name: "VSCRatchet",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.0/VSCRatchet.xcframework.zip",
            checksum: "e548c0b3ad7341d75d75727bb6d7cea507d5db6570b4fc71e64fc88cb4574f7d"
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
