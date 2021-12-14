// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftEncore",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "SwiftEncore", targets: ["SwiftEncore"]),
    ],
    targets: [
        .target(name: "SwiftEncore", dependencies: [
            .product(name: "Algorithms", package: "swift-algorithms"),
            .target(name: "AnyEquatable"),
            .target(name: "Builders"),
            .product(name: "CasePaths", package: "swift-case-paths"),
            .product(name: "CollectionConcurrencyKit", package: "CollectionConcurrencyKit"),
            .product(name: "CustomDump", package: "swift-custom-dump"),
            .target(name: "Doo"),
            .target(name: "EnumTag"),
            .target(name: "NilGuardingOperators"),
            .product(name: "NonEmpty", package: "swift-nonempty"),
            .product(name: "Tagged", package: "swift-tagged"),
            .target(name: "UnwrapTuple"),
        ]),
        .testTarget(name: "SwiftEncoreTests", dependencies: [
            .target(name: "SwiftEncore"),
        ]),

        .target(name: "AnyEquatable"),
        .testTarget(name: "AnyEquatableTests", dependencies: [
            .target(name: "AnyEquatable"),
        ]),

        .target(name: "Builders"),
        .testTarget(name: "BuildersTests", dependencies: [
            .target(name: "Builders"),
        ]),

        .target(name: "Doo", exclude: ["Doo.swift.gyb"]),
        .testTarget(name: "DooTests", dependencies: [
            .target(name: "Doo"),
        ]),

        .target(name: "EnumTag"),

        .target(name: "NilGuardingOperators"),
        .testTarget(name: "NilGuardingOperatorsTests", dependencies: [
            .target(name: "NilGuardingOperators"),
            .product(name: "TestableAssert", package: "TestableAssert"),
        ]),

        .target(name: "UnwrapTuple", exclude: ["UnwrapTuple.swift.gyb"]),
    ]
)

package.dependencies = [
    .package(name: "CollectionConcurrencyKit", url: "https://github.com/davdroman/CollectionConcurrencyKit", branch: "main"),
    .package(name: "swift-algorithms", url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
    .package(name: "swift-case-paths", url: "https://github.com/pointfreeco/swift-case-paths", from: "0.7.0"),
    .package(name: "swift-custom-dump", url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.2.1"),
    .package(name: "swift-nonempty", url: "https://github.com/pointfreeco/swift-nonempty", from: "0.3.1"),
    .package(name: "swift-tagged", url: "https://github.com/pointfreeco/swift-tagged", from: "0.6.0"),
    .package(name: "TestableAssert", url: "https://github.com/vinceplusplus/TestableAssert", from: "1.0.0"),
]