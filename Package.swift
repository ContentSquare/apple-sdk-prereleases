// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContentsquareSDK",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ContentsquareSDK",
            targets: [
                "__ContentsquareSDK"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK_DYNAMIC.git", exact: "4.41.0"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.8.2"),
        .package(url: "https://github.com/ContentSquare/apple-interim-bridge-sdk.git", exact: "0.9.0-alpha.1"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.8.0"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.0"),
    ],
    targets: [
        .target(
            name: "__ContentsquareSDK",
            dependencies: [
                "ContentsquareSDK",
                .product(name: "ContentsquareModule", package: "CS_iOS_SDK_DYNAMIC"),
                .product(name: "ContentsquareInterimBridge", package: "apple-interim-bridge-sdk", condition: .when(platforms: [ .iOS ])),
                .product(name: "HeapIOSAutocapture", package: "heap-ios-autocapture-sdk"),
                .product(name: "HeapNotificationAutocapture", package: "heap-notification-autocapture-sdk"),
                .product(name: "HeapSwiftCore", package: "heap-swift-core-sdk"),
            ]
        ),
        .binaryTarget(
            name: "ContentsquareSDK",
            url: "https://github.com/ContentSquare/apple-sdk-prereleases/releases/download/1.0.0-rc.26/package.zip",
            checksum: "982d89c893c4fb9a86446f0af44ec2734a6dab978e490a6ca065e869a4b3bc2f"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
