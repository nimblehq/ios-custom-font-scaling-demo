//
//  Lifecycle+Title.swift
//  CustomDynamicFont
//
//  Created by Bliss on 15/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

extension Lifecycle {

    func title() -> String {
        switch self {
        case .uikit:
            return R.string.localizable.ios11uikitLifecyclelabelTitle()
        case .swiftui:
            return R.string.localizable.ios12swiftuiLifecyclelabelTitle()
        }
    }
}
