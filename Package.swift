// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "CCAIKit",
  platforms: [
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "CCAIKit",
      targets: ["WrapperCCAIChatRed", "WrapperCCAICallRed", "WrapperCCAIScreenShare"]),
    .library(
      name: "CCAIChat",
      targets: ["WrapperCCAIChatRed"]),
    .library(
      name: "CCAICall",
      targets: ["WrapperCCAICallRed"]),
    .library(
      name: "CCAIScreenShare",
      targets: ["WrapperCCAIScreenShare"])
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", exact: "4.0.7"),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", exact: "3.14.0"),
    .package(url: "https://github.com/twilio/twilio-voice-ios", exact: "6.13.6"),
  ],
  targets: [
    .binaryTarget(
      name: "CCAIKit",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.5.0/CCAIKit.xcframework.zip",
      checksum: "2947e824b79423606f35d2c2d682f2e4fd405138ed29061933d890a57cdc1de8"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.5.0/CCAIChat.xcframework.zip",
      checksum: "04dee0c9049df84dbca9df09634176b54fe60cf1c69e42a26724289dc67c1c94"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.5.0/CCAIChatRed.xcframework.zip",
      checksum: "b0c6b23b4e783e087c99cbab0767f9413815661af2589a2d86dd757f78c6d1ce"
    ),

    .binaryTarget(
      name: "CCAICall",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.5.0/CCAICall.xcframework.zip",
      checksum: "abbd5ae00446069476e6c149baaa804bdf1772c3ff23936ac57103e30f633652"
    ),

    .binaryTarget(
      name: "CCAICallRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.5.0/CCAICallRed.xcframework.zip",
      checksum: "55917eecc88d0ce5c059cd66385ebd371e5a6315927cad427eaba7c1c5afdc4d"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.5.0/CCAIScreenShare.xcframework.zip",
      checksum: "0c9e0326953c41a5463040749a1e7504a8363b4e18ab88ea5854957ffb75fd94"
    ),

    .target(
      name: "WrapperCCAIKit",
      dependencies: [
        "CCAIKit"
      ]
    ),

    .target(
      name: "WrapperCCAIChat",
      dependencies: [
        "CCAIKit",
        "CCAIChat"
      ]
    ),

    .target(
      name: "WrapperCCAIChatRed",
      dependencies: [
        "CCAIKit",
        "CCAIChat",
        "CCAIChatRed",
        .product(name: "TwilioConversationsClient", package: "conversations-ios")
      ]
    ),

    .target(
      name: "WrapperCCAICall",
      dependencies: [
        "CCAIKit",
        "CCAICall"
      ]
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
      name: "WrapperCCAIScreenShare",
      dependencies: [
        "CCAIKit",
        "CCAIScreenShare",
        .product(name: "CobrowseSDK", package: "cobrowse-sdk-ios-binary")
      ]
    ),
  ]
)
