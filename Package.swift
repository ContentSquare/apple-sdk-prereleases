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
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK.git", exact: "4.40.2"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.8.1"),
        .package(url: "https://github.com/heap/heap-ios-cs-integration-sdk.git", exact: "0.8.0"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.8.0"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.0"),
    ],
    targets: [
        .target(
            name: "__ContentsquareSDK",
            dependencies: [
                "ContentsquareSDK",
                .product(name: "ContentsquareModule", package: "CS_iOS_SDK"),
                .product(name: "HeapContentsquareIntegrationSDK", package: "heap-ios-cs-integration-sdk"),
                .product(name: "HeapIOSAutocapture", package: "heap-ios-autocapture-sdk"),
                .product(name: "HeapNotificationAutocapture", package: "heap-notification-autocapture-sdk"),
                .product(name: "HeapSwiftCore", package: "heap-swift-core-sdk"),
            ]
        ),
        .binaryTarget(
            name: "ContentsquareSDK",
            url: "https://github.com/ContentSquare/apple-sdk-prereleases/releases/download/0.0.102-rc.6/package.zip",
            checksum: "0f977e1a3f094f1dfea65ddad63e6bf30bedf11fcde9b53f8c50a83b8476cd69"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
