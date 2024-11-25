// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Package",
            targets: ["Package"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            exact: "5.10.1"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Package",
            dependencies: [
                .target(name: "SPMPackage"),
                .product(name: "AlamofireDynamic", package: "Alamofire")
            ]
        ),
        .binaryTarget(name: "SPMPackage", path: "Frameworks/SPMTest.xcframework"),
        .testTarget(
            name: "PackageTests",
            dependencies: ["Package"]
        ),
    ]
)
