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
            checksum: "5f63c20f43bff3d419b1f4081de2ef05b59469d317f72a80bf8d28de15905f09"
        ),

        .binaryTarget(
            name: "VSCFoundation",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.1/VSCFoundation.xcframework.zip",
            checksum: "ac931b8b1ff03e06fffc15f9a4765ed7fa5ab52c6a4c31f3b32255764a9af564"
        ),

        .binaryTarget(
            name: "VSCPythia",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.1/VSCPythia.xcframework.zip",
            checksum: "350e1b937b078afc0b2a572abe5990cdd36f3f4562dc12c5e311e695bb79e38e"
        ),

        .binaryTarget(
            name: "VSCRatchet",
            url: "https://github.com/VirgilSecurity/virgil-crypto-c/releases/download/v0.16.1/VSCRatchet.xcframework.zip",
            checksum: "4c8c84f848714f75784f7a583ef69a4ebc861a0f388db8424296296a802b2328"
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
