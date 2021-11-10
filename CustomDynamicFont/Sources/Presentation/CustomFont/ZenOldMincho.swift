//
//  ZenOldMincho.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

extension UIFont {

    enum ZenOldMincho: DynamicFont {

        case regular
        case bold

        func fontName() -> String {
            switch self {
            case .regular: return "ZenOldMincho-Regular"
            case .bold: return "ZenOldMincho-Bold"
            }
        }

        // swiftlint:disable:next cyclomatic_complexity
        func fontSize(style: UIFont.TextStyle) -> CGFloat {
            switch style {
            case .largeTitle: return 34.0
            case .title1: return 28.0
            case .title2: return 22.0
            case .title3: return 20.0
            case .headline: return 17.0
            case .body: return 17.0
            case .callout: return 16.0
            case .subheadline: return 15.0
            case .footnote: return 13.0
            case .caption1: return 12.0
            case .caption2: return 11.0
            default: return 17.0
            }
        }
    }
}
