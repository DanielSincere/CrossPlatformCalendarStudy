// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "CrossPlatformCalendarStudy",
    products: [
        .library(
            name: "CrossPlatformCalendarStudy",
            targets: ["CrossPlatformCalendarStudy"]),
    ],
    targets: [
        .target(
            name: "CrossPlatformCalendarStudy"),
        .testTarget(
            name: "CrossPlatformCalendarStudyTests",
            dependencies: ["CrossPlatformCalendarStudy"]),
    ]
)
