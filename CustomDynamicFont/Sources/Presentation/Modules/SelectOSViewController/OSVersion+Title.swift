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
            return "iOS 10"
        case .iosGreaterAndEqualTo11:
            return "iOS >=11"
        }
    }
}
