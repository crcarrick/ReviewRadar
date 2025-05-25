// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "GithubClient",
    platforms: [.macOS(.v15)],
    products: [
        .library(
            name: "GithubClient",
            targets: ["GithubClient"]),
    ],
    targets: [
        .target(
            name: "GithubClient"),
        .testTarget(
            name: "GithubClientTests",
            dependencies: ["GithubClient"]
        ),
    ]
)
