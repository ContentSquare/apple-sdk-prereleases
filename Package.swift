// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContentsquareSDK",
    platforms: [
        .macOS(.v11),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "ContentsquareSDK",
            targets: [
                "__Contentsquare"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK.git", exact: "4.40.2"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.8.1"),
        .package(url: "https://github.com/heap/heap-ios-cs-integration-sdk.git", exact: "0.8.0"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.8.0"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.0"),
    ],
    targets: [
        .target(
            name: "__Contentsquare",
            dependencies: [
                .product(name: "ContentsquareSDK"),
                .product(name: "ContentsquareModule", package: "CS_iOS_SDK"),
                .product(name: "HeapContentsquareIntegrationSDK", package: "heap-ios-cs-integration-sdk"),
                .product(name: "HeapIOSAutocapture", package: "heap-ios-autocapture-sdk"),
                .product(name: "HeapNotificationAutocapture", package: "heap-notification-autocapture-sdk"),
                .product(name: "HeapSwiftCore", package: "heap-swift-core-sdk"),
            ]
        ),
        .binaryTarget(
            name: "ContentsquareSDK",
            url: "https://github.com/ContentSquare/apple-sdk-prereleases/releases/download/0.0.101-rc.5/package.zip",
            checksum: "adb40a78b6478f25147bbc9272d154c13028e6ed9e971dab0db90db83e636cd0"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
