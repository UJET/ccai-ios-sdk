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
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAIKit.xcframework.zip",
      checksum: "f60df46e9b1bc1fbea72091382d98c8fde68c95a317a4fa9f69f71b834e97417"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAIChat.xcframework.zip",
      checksum: "990a9e77ef547b5cf7b6e4ffe672f1f0d8f57fdc9baf0927db6e54a3b9d976a0"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAIChatRed.xcframework.zip",
      checksum: "486994bd9a15f032844b2f2530c83c1a8abd1680313a7117da671248b2cf50cf"
    ),

    .binaryTarget(
      name: "CCAICall",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAICall.xcframework.zip",
      checksum: "58dc341be80dd27c010c437b9f81c762aa80e3e7935dc5e1eef8dce271648d6f"
    ),

    .binaryTarget(
      name: "CCAICallRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAICallRed.xcframework.zip",
      checksum: "09d932b106d7116aea2434c785cdaf57945eeff48538b06f7edc8eccfb4f0ad2"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAIScreenShare.xcframework.zip",
      checksum: "810e3e78b3d4954aad32a7a614a6bff0920cedc30980bd93141b675902f23ffc"
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
