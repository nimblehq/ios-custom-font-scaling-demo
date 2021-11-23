//
//  UIContentSizeCategory+Label.swift
//  CustomDynamicFont
//
//  Created by Bliss on 15/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

extension UIContentSizeCategory {

    func label() -> String {
        switch self {
        case .small:
            return R.string.localizable.overrideFontSizeSmallLabel()
        case .medium:
            return R.string.localizable.overrideFontSizeNormalLabel()
        case .large:
            return R.string.localizable.overrideFontSizeLargeLabel()
        case .extraLarge:
            return R.string.localizable.overrideFontSizeExtraLargeLabel()
        default: return ""
        }
    }
}
