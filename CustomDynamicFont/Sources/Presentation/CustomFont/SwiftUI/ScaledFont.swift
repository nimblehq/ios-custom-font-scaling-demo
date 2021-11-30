//
//  ScaledFont.swift
//  CustomDynamicFont
//
//  Created by Bliss on 30/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            return content.font(.custom(name, size: size))
        } else {
            let scaledSize = UIFontMetrics.default.scaledValue(for: size)
            return content.font(.custom(name, size: scaledSize))
        }
    }
}

@available(iOS 13.0, *)
extension View {
    func scaledFont(
        font: DynamicFont,
        forTextStyle style: UIFont.TextStyle
    ) -> some View {
        return self.modifier(ScaledFont(name: font.fontName(), size: font.fontSize(style: style)))
    }
}
