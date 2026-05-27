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
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.3/CCAIKit.xcframework.zip",
      checksum: "9b1ae38a4037f2b8cc8b50ca8a80a051e936be8e4acc41f6cb3309a986dac772"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.3/CCAIChat.xcframework.zip",
      checksum: "86f7cc48a184e60952e1e0f47aeda9f53321fa351a1638494903292b293038ae"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.3/CCAIChatRed.xcframework.zip",
      checksum: "6f170d5a36c36800e0f9d97a8dee5923ce81e3f147cc8782b27d6ae500140560"
    ),

    .binaryTarget(
      name: "CCAICall",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.3/CCAICall.xcframework.zip",
      checksum: "ad406b8d484e828b6d5f03110c6cea0aafeef1b8092de359739c4f797e09a0df"
    ),

    .binaryTarget(
      name: "CCAICallRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.3/CCAICallRed.xcframework.zip",
      checksum: "c0b958fc206fab88fbaeed78d4a07a1ec59a0fbd05ed305c1f0ddd7661ec33b8"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.3/CCAIScreenShare.xcframework.zip",
      checksum: "1abefb5306b1613d3ee4d7ac001796eb48cca13f0ff576009c4542f6e7f0f323"
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
