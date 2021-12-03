//
//  OverridingFont+Title.swift
//  CustomDynamicFont
//
//  Created by Bliss on 3/12/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

extension OverridingFont {

    func title() -> String {
        switch self {
        case .isOn:
            return R.string.localizable.ios11UIKitOverrideFontSegmentOptionsOn()
        case .isOff:
            return R.string.localizable.ios11UIKitOverrideFontSegmentOptionsOff()
        }
    }
}
