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
      checksum: "37535e44b3036ee87aba7cef4aca8c2ffd4949fe9e6d05a24908ad665079b4cb"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAIChat.xcframework.zip",
      checksum: "cc4e324f958b5eded908ccbf9df8d250cf24469ad6d618f465a38b06e1a69d35"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAIChatRed.xcframework.zip",
      checksum: "aeea8155215b8e63cb57e7b5b8c2b22dfbf890164dabe38985865019cf787d0b"
    ),

    .binaryTarget(
      name: "CCAICall",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAICall.xcframework.zip",
      checksum: "ae96ca7184020fa90d5ca4c7456eda34a1aa321cfc6b7fffebb890e9c5f043d4"
    ),

    .binaryTarget(
      name: "CCAICallRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAICallRed.xcframework.zip",
      checksum: "6851887b4e9dbcc86f62068dea6cde97984547f9852fb6b906b732d2e0cbde36"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.4.0/CCAIScreenShare.xcframework.zip",
      checksum: "8135d52e80d8f18d74d4bdfee361f7f9e48de018c41126054ca48900c47d956d"
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
