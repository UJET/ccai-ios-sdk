# ccai-ios-sdk

Swift Package Manager distribution of the **CCAI Platform iOS SDK**.

This repository contains only the package manifest. The SDK itself is shipped as prebuilt binary XCFrameworks that are downloaded when the package is resolved.

## Requirements

- iOS 16.0+
- Swift tools 5.7+ (Xcode 14+)

## Installation

In Xcode, choose **File > Add Package Dependencies…** and enter:

```
https://github.com/UJET/ccai-ios-sdk
```

Or add it to your `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/UJET/ccai-ios-sdk", .upToNextMajor(from: "3.5.0"))
]
```

## Products

| Product | Includes |
| --- | --- |
| `CCAIKit` | Chat, call and screen share |
| `CCAIChat` | Chat only |
| `CCAICall` | Call only |
| `CCAIScreenShare` | Screen share only |

Third-party dependencies (Twilio Conversations, Twilio Voice, Cobrowse.io) are resolved automatically.
