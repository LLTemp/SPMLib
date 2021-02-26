// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDKLib",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "SDKLib", targets: ["UnitTestWithPodTarget"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0"),
        .package(name: "KeychainSwift", url: "https://github.com/evgenyneu/keychain-swift.git", from: "19.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UnitTestWithPodTarget",
            dependencies: [
                .target(name: "UnitTestWithPodWrapper")
              ]
            ),
        .target(
                name: "UnitTestWithPodWrapper",
                dependencies: [
                    .target(name: "UnitTestWithPod"),
                    .product(name: "GRPC", package: "grpc-swift"),
                    .product(name: "CGRPCZlib", package: "grpc-swift"),
                    .product(name: "KeychainSwift", package: "KeychainSwift"),
                    
                ]
        ),
        .binaryTarget(
                name: "UnitTestWithPod",
                url: "https://testbuildartefacts.s3.us-east-2.amazonaws.com/sic-sdk-ios/1.2.3/UnitTestWithPod.xcframework.zip",
                checksum: "cce6618d8b36bc0a723cd0468ee4155443ced9073f5adb7cf7e0d0ce9dd0444a"
        )
    ]
)
