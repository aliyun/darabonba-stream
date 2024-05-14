// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
        name: "DarabonbaStream",
        platforms: [.macOS(.v10_15),
                    .iOS(.v13),
                    .tvOS(.v13),
                    .watchOS(.v6)],
        products: [
            .library(
                    name: "DarabonbaStream",
                    targets: ["DarabonbaStream"])
        ],
        dependencies: [
            // Dependencies declare other packages that this package depends on.
            .package(url: "https://github.com/aliyun/tea-swift.git", from: "1.0.2"),
        ],
        targets: [
            .target(
                    name: "DarabonbaStream",
                    dependencies: [
                        .product(name: "Tea", package: "tea-swift")
                    ]),
            .testTarget(
                name: "DarabonbaStreamTests",
                dependencies: [
                    "DarabonbaStream",
                    .product(name: "Tea", package: "tea-swift")
                ]),
        ],
        swiftLanguageVersions: [.v5]
)
