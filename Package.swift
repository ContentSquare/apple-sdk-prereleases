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
                "__ContentsquareSDK"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK_DYNAMIC.git", exact: "4.41.99"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.8.1"),
        .package(url: "https://github.com/heap/heap-ios-cs-integration-sdk.git", exact: "0.9.0-rc.1"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.8.0"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.0"),
    ],
    targets: [
        .target(
            name: "__ContentsquareSDK",
            dependencies: [
                "ContentsquareSDK",
                .product(name: "ContentsquareModule", package: "CS_iOS_SDK_DYNAMIC"),
                .product(name: "HeapContentsquareIntegrationSDK", package: "heap-ios-cs-integration-sdk"),
                .product(name: "HeapIOSAutocapture", package: "heap-ios-autocapture-sdk"),
                .product(name: "HeapNotificationAutocapture", package: "heap-notification-autocapture-sdk"),
                .product(name: "HeapSwiftCore", package: "heap-swift-core-sdk"),
            ]
        ),
        .binaryTarget(
            name: "ContentsquareSDK",
            url: "https://github.com/ContentSquare/apple-sdk-prereleases/releases/download/1.0.0-rc.22/package.zip",
            checksum: "a275152f7fb4ad42803faea829523bc1102ef3a1b27f31afb329a512274cdb26"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
