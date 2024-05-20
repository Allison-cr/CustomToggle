// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CustomToggle",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "CustomToggle",
            targets: ["CustomToggle"]),
    ],
    targets: [
        .target(
            name: "CustomToggle"),
        .testTarget(
            name: "CustomToggleTests",
            dependencies: ["CustomToggle"]),
    ]
)
