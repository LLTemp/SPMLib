// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDKLib",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "SDKLib", targets: ["UnitTestWithPod"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0"),
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "19.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
                name: "UnitTestWithPod",
                url: "https://testbuildartefacts.s3.us-east-2.amazonaws.com/sic-sdk-ios/1.2.3/UnitTestWithPod.xcframework.zip",
                checksum: "47e5bf85fa18b0072339fd2ffdad1841bbd5a007ab9efee2ed5d10a5c335900e"
        )
    ]
)
