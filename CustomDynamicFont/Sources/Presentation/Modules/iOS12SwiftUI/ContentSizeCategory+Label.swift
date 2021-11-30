//
//  ContentSizeCategory+Label.swift
//  CustomDynamicFont
//
//  Created by Bliss on 30/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
extension ContentSizeCategory {

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
