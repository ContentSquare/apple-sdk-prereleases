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
                "Contentsquare",
                "HeapContentsquareIntegrationSDK",
                "HeapIOSAutocapture",
                "HeapNotificationAutocapture",
                "HeapSwiftCore",
            ]
        ),
        .binaryTarget(
            name: "Contentsquare",
            url: "https://github.com/ContentSquare/apple-sdk-prereleases/releases/download/0.0.100/package.zip",
            checksum: "19e90a6daf06fcd3b98b25a7ce037a89d8236abfcb52a3b789529b625b737236"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
