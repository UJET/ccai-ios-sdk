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
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.1/CCAIKit.xcframework.zip",
      checksum: "5d50e109d2f6499953091d14c76c7df2bba0df7f350549bbec5bc0a01394f14a"
    ),

    .binaryTarget(
      name: "CCAIChat",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.1/CCAIChat.xcframework.zip",
      checksum: "cb1a72c24fb56a7a4a7619b92390096749a192145c1dfa6b01b1ed08866af7e2"
    ),

    .binaryTarget(
      name: "CCAIChatRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.1/CCAIChatRed.xcframework.zip",
      checksum: "184f8c14482e7a2a56ef4a340737b2b3e97523d6d1acada23bd45d20788d4d9a"
    ),

    .binaryTarget(
      name: "CCAICall",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.1/CCAICall.xcframework.zip",
      checksum: "e7d06f21349ba8e1e534cb1520d23b23cccd2de78c626f08c80d9c79b7efd628"
    ),

    .binaryTarget(
      name: "CCAICallRed",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.1/CCAICallRed.xcframework.zip",
      checksum: "ead8f6ed9d7bc16f3752ae0709c1b41a1af4b932dd10764a3bc1bc4c8f1cc471"
    ),

    .binaryTarget(
      name: "CCAIScreenShare",
      url: "https://sdk.ujet.co/ccaip/ios-staging/3.3.1/CCAIScreenShare.xcframework.zip",
      checksum: "ce734ecae5fdf0c77779822c2abe46fc32b43e5fd9fe555386e8fd393ec468f7"
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
