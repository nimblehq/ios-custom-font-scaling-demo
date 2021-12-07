# Custom Dynamic Font

A simple guide to introducing Dynamic Typing for a custom font to your UIKit and SwiftUI project.

## Requirements

Xcode 12.0

## Installation

Download and import the file [UIFont+CustomFont.swift](https://github.com/nimblehq/ios-custom-font-scaling-demo/blob/develop/CustomDynamicFont/Sources/Presentation/CustomFont/UIFont%2BCustomFont.swift).

## Usage

Declare a new `DynamicFont` type with the example file [ZenOldMincho.swift](https://github.com/nimblehq/ios-custom-font-scaling-demo/blob/develop/CustomDynamicFont/Sources/Presentation/CustomFont/ZenOldMincho.swift). Ignore `DynamicFontIOS10` for iOS 11 and above.

### Use in place of UIFont
```
label.font = .customFont(ZenOldMincho.regular, forTextStyle: .body)
```

## Read more
The demo is accompanied by the blog post [Adding Dynamic Custom Typing to your iOS Project](https://www.notion.so/nimblehq/Adding-Dynamic-Custom-Typing-to-your-iOS-Project-728bd13863964010b0c4bb9d3ae5a832)
