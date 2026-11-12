// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CCAIKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "CCAIKit", targets: ["WrapperCCAICallRed", "WrapperCCAIChatRed", "WrapperCCAIScreenShare"]),
        .library(name: "CCAICall", targets: ["WrapperCCAICallRed"]),
        .library(name: "CCAIChat", targets: ["WrapperCCAIChatRed"]),
        .library(name: "CCAIScreenShare", targets: ["WrapperCCAIScreenShare"])
    ],
    dependencies: [
        .package(url: "https://github.com/twilio/twilio-voice-ios", exact: "6.13.6"),
        .package(url: "https://github.com/twilio/conversations-ios", exact: "4.0.7"),
        .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", exact: "3.14.0")
    ],
    targets: [
        .binaryTarget(
            name: "CCAIKit",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.1/CCAIKit.xcframework.zip",
            checksum: "000d47b9cf5f5956c36958053f982abd6e44c4cded230012a5317da6ff1d94e3"
        ),
        .binaryTarget(
            name: "CCAICall",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.1/CCAICall.xcframework.zip",
            checksum: "d30707468037a8f5006041e9a34069a7a75018ca31c39607e7a1f3986ef8ecf9"
        ),
        .binaryTarget(
            name: "CCAICallRed",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.1/CCAICallRed.xcframework.zip",
            checksum: "4ca5b93c4b037a7737b72db19cd829de367660b33ca0c774a8695452a7ce1b5c"
        ),
        .binaryTarget(
            name: "CCAIChat",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.1/CCAIChat.xcframework.zip",
            checksum: "ecfa0e39d9fb30c5f2c17d3a1b3a315212cf805d3e51499693af71592aa4734d"
        ),
        .binaryTarget(
            name: "CCAIChatRed",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.1/CCAIChatRed.xcframework.zip",
            checksum: "1a9aa7842755e1213e0cbe9ef602da0fa32e4b761ea05bcabe418ff1858baf3b"
        ),
        .binaryTarget(
            name: "CCAIChatBlue",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.1/CCAIChatBlue.xcframework.zip",
            checksum: "28cf8a32623b29b8a42f065e365cea9c0ffa6c46e727d3d84e0865e6e5110b86"
        ),
        .binaryTarget(
            name: "CCAIScreenShare",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.1/CCAIScreenShare.xcframework.zip",
            checksum: "cfa96d735f3fc482acf7807d8314c37e0ed8f390e336ed3eddd94413fa451bb3"
        ),
        .target(
            name: "WrapperCCAICallRed",
            dependencies: [
                "CCAIKit",
                "CCAICall",
                "CCAICallRed",
                .product(name: "TwilioVoice", package: "twilio-voice-ios")
            ]
        ),
        .target(
            name: "WrapperCCAIChatRed",
            dependencies: [
                "CCAIKit",
                "CCAIChat",
                "CCAIChatRed",
                "CCAIChatBlue",
                .product(name: "TwilioConversationsClient", package: "conversations-ios")
            ]
        ),
        .target(
            name: "WrapperCCAIScreenShare",
            dependencies: [
                "CCAIKit",
                "CCAIScreenShare",
                .product(name: "CobrowseSDK", package: "cobrowse-sdk-ios-binary")
            ]
        )
    ]
)
