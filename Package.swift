// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Contentsquare",
    platforms: [
        .macOS(.v11),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Contentsquare",
            targets: [
                "__Contentsquare"
            ]),
    ],
    dependencies: [
//        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK.git", exact: "4.40.0"),
//        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.8.0"),
//        .package(url: "https://github.com/heap/heap-ios-cs-integration-sdk.git", exact: "0.8.0"),
//        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.8.0"),
//        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "__Contentsquare",
            dependencies: [
                "Contentsquare",
//                "HeapContentsquareIntegrationSDK",
//                "HeapIOSAutocapture",
//                "HeapNotificationAutocapture",
//                "HeapSwiftCore",
            ]
        ),
        .binaryTarget(
            name: "Contentsquare",
            url: "https://github.com/ContentSquare/apple-sdk-prereleases/releases/download/1.0.0-rc.6/package.zip",
            checksum: "6bdf83578c806712653e5f3479cd90fc38f6b79afdf5d2c3aa5f3c3d8ce4180d"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
