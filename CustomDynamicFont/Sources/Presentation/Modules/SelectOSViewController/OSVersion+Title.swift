//
//  OSVersion+Title.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Foundation

extension OSVersion {

    func title() -> String {
        switch self {
        case .ios10:
            return R.string.localizable.osVersionIos10Title()
        case .iosGreaterOrEqualTo11:
            return R.string.localizable.osVersionIos11Title()
        }
    }
}
