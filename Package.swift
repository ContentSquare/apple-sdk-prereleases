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
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK_DYNAMIC.git", exact: "4.53.0-alpha.18"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.9.2"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.10.3"),
        .package(url: "https://github.com/ContentSquare/apple-core-sdk.git", revision: "f01dfb5f92cd07487d35a1ec9906c22c21660b3b"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.3"),
    ],
    targets: [
        .target(
            name: "__ContentsquareSDK",
            dependencies: [
                "ContentsquareSDK",
                .product(name: "ContentsquareModule", package: "CS_iOS_SDK_DYNAMIC", condition: .when(platforms: [ .iOS ])),
                .product(name: "HeapIOSAutocapture", package: "heap-ios-autocapture-sdk", condition: .when(platforms: [ .iOS, .macCatalyst ])),
                .product(name: "HeapNotificationAutocapture", package: "heap-notification-autocapture-sdk", condition: .when(platforms: [ .iOS, .macCatalyst, .macOS, .watchOS, .visionOS ])),
                .product(name: "HeapSwiftCore", package: "heap-swift-core-sdk"),
                .product(name: "ContentsquareCore", package: "apple-core-sdk"),
            ]
        ),
        .binaryTarget(
            name: "ContentsquareSDK",
            url: "https://github.com/ContentSquare/apple-sdk-prereleases/releases/download/1.12.5-alpha.2/package.zip",
            checksum: "e98688b855a296fa743eaf13523a7871a8c3fc25205d0ba3930d990daa8e870d"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
