// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AzureMapsControl",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AzureMapsControl",
            targets: ["AzureMapsControl", "MapControlDependencies"]
        )
    ],
    dependencies: [
        .package(
            name: "MapLibre GL Native",
            url: "https://github.com/maplibre/maplibre-gl-native-distribution.git",
            .exact("5.12.0")
        ),
        .package(
            name: "MSAL",
            url: "https://github.com/AzureAD/microsoft-authentication-library-for-objc",
            .exact("1.2.5")
        )
    ],
    targets: [
        .binaryTarget(
            name: "AzureMapsControl",
            url: "https://github.com/DEV-TW/azure-maps-ios-sdk-distribution/releases/download/1.0.0-pre.4/AzureMapsControl.xcframework.zip",
            checksum: "952ac88a0ad15a2c690e61fb31f89ae16bac279caf09ff9aef9ea2551c2e0085"
        ),
        .target(
            name: "MapControlDependencies",
            dependencies: [
                .product(
                    name: "Mapbox",
                    package: "MapLibre GL Native",
                    condition: .when(platforms: [.iOS])
                ),
                .product(
                    name: "MSAL",
                    package: "MSAL",
                    condition: .when(platforms: [.iOS])
                )
            ],
            path: "./Sources"
        )
    ]
)
