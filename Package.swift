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
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.2/CCAIKit.xcframework.zip",
            checksum: "0b20b8f65bcb8619e158f2e36af3029e1eb42dc7b185ef284b8f0f1bd015a4fc"
        ),
        .binaryTarget(
            name: "CCAICall",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.2/CCAICall.xcframework.zip",
            checksum: "94c0c50b68cbdeeb216ce0a8d7ab1d79e6fdd74d3b63c41200ecee8c6f7df624"
        ),
        .binaryTarget(
            name: "CCAICallRed",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.2/CCAICallRed.xcframework.zip",
            checksum: "2ad2066089ecd3215c6c27f7046103551e90fb9e04e17320b29f9faaf959bc47"
        ),
        .binaryTarget(
            name: "CCAIChat",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.2/CCAIChat.xcframework.zip",
            checksum: "e2767d7f6bf5af667b53b09b808364656fe85eef1f287d151c10456bf1262296"
        ),
        .binaryTarget(
            name: "CCAIChatRed",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.2/CCAIChatRed.xcframework.zip",
            checksum: "e2a26903f8adfe94534ee8eed96193ef6e070ec03e8517f3cbf6d1ad402dd737"
        ),
        .binaryTarget(
            name: "CCAIChatBlue",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.2/CCAIChatBlue.xcframework.zip",
            checksum: "472864ac5c0b9ff2766ae537772fb2b22c2469c4f5070c44de2d4661fec4876f"
        ),
        .binaryTarget(
            name: "CCAIScreenShare",
            url: "https://sdk.ujet.co/ccaip/ios-staging/3.6.0-rc.2/CCAIScreenShare.xcframework.zip",
            checksum: "a5ef3fae12e563954e6b01ac6b1b9001108ac923f8915c8a65b4f21319761808"
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
