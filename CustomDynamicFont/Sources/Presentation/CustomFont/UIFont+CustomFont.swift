//
//  UIFont+CustomFont.swift
//  CustomDynamicFont
//
//  Created by Bliss on 5/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

protocol DynamicFont {

    func fontName() -> String
    func fontSize(style: UIFont.TextStyle) -> CGFloat
}

extension UIFont {

    class func customFont(_ font: DynamicFont, forTextStyle style: UIFont.TextStyle) -> UIFont? {
        guard let customFont = UIFont(name: font.fontName(), size: font.fontSize(style: style)) else { return nil }
        let metrics = UIFontMetrics(forTextStyle: style)
        let scaledFont: UIFont

        if #available(iOS 11.0, *) {
            scaledFont = metrics.scaledFont(for: customFont)
        } else {
            #warning("Implement iOS 10 font scaling logic")
            scaledFont = customFont
        }

        return scaledFont
    }
}
