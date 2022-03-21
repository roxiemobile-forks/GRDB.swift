// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Allow building GRDBCipher with SwiftPM
// @see https://github.com/groue/GRDB.swift/pull/556#issuecomment-686804737

// Configure SPM target to use SQLCipher
// @see https://github.com/metabolist/GRDB.swift/commit/ea3ed26ddc82f72c2d9c50111977df7671ca1e64

let package = Package(
    name: "GRDB",
    platforms: [
        .iOS("12.0"),
        .macOS("10.12"),
        .tvOS("12.0"),
        .watchOS("3.0"),
    ],
    products: [
        .library(name: "GRDB", targets: ["GRDB"]),
    ],
    targets: [
        .target(
            name: "GRDB",
            dependencies: [
                .target(name: "SQLCipher"),
            ],
            path: "GRDB",
            cSettings: [
                .define("SQLITE_HAS_CODEC"),
                .define("SQLITE_TEMP_STORE", to: "2"),
                .define("SQLITE_SOUNDEX"),
                .define("SQLITE_THREADSAFE"),
                .define("SQLITE_ENABLE_RTREE"),
                .define("SQLITE_ENABLE_STAT3"),
                .define("SQLITE_ENABLE_STAT4"),
                .define("SQLITE_ENABLE_COLUMN_METADATA"),
                .define("SQLITE_ENABLE_MEMORY_MANAGEMENT"),
                .define("SQLITE_ENABLE_LOAD_EXTENSION"),
                .define("SQLITE_ENABLE_FTS4"),
                .define("SQLITE_ENABLE_FTS4_UNICODE61"),
                .define("SQLITE_ENABLE_FTS3_PARENTHESIS"),
                .define("SQLITE_ENABLE_UNLOCK_NOTIFY"),
                .define("SQLITE_ENABLE_JSON1"),
                .define("SQLITE_ENABLE_FTS5"),
                .define("SQLCIPHER_CRYPTO_CC"),
                .define("HAVE_USLEEP", to: "1"),
                .define("SQLITE_MAX_VARIABLE_NUMBER", to: "99999"),
            ],
            swiftSettings: [
                .define("SQLITE_HAS_CODEC"),
                .define("GRDBCIPHER"),
                .define("SQLITE_ENABLE_FTS5"),
            ]
        ),
        .target(
            name: "SQLCipher",
            cSettings: [
                .define("NDEBUG"),
                .define("SQLITE_HAS_CODEC"),
                .define("SQLITE_TEMP_STORE", to: "2"),
                .define("SQLITE_SOUNDEX"),
                .define("SQLITE_THREADSAFE"),
                .define("SQLITE_ENABLE_RTREE"),
                .define("SQLITE_ENABLE_STAT3"),
                .define("SQLITE_ENABLE_STAT4"),
                .define("SQLITE_ENABLE_COLUMN_METADATA"),
                .define("SQLITE_ENABLE_MEMORY_MANAGEMENT"),
                .define("SQLITE_ENABLE_LOAD_EXTENSION"),
                .define("SQLITE_ENABLE_FTS4"),
                .define("SQLITE_ENABLE_FTS4_UNICODE61"),
                .define("SQLITE_ENABLE_FTS3_PARENTHESIS"),
                .define("SQLITE_ENABLE_UNLOCK_NOTIFY"),
                .define("SQLITE_ENABLE_JSON1"),
                .define("SQLITE_ENABLE_FTS5"),
                .define("SQLCIPHER_CRYPTO_CC"),
                .define("HAVE_USLEEP", to: "1"),
                .define("SQLITE_MAX_VARIABLE_NUMBER", to: "99999"),
                .define("HAVE_GETHOSTUUID", to: "0"),
//              .unsafeFlags(["--no-warnings"]),
                .define("ROXIE_WARN_INHIBIT_ALL_WARNINGS"),
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
