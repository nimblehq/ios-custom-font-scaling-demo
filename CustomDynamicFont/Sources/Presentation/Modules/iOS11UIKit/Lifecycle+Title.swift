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
        case .uiKit:
            return R.string.localizable.ios11UIKitLifecycleLabelTitle()
        case .swiftUI:
            return R.string.localizable.ios12SwiftUILifecycleLabelTitle()
        }
    }
}
