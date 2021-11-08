//
//  OSVersion.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Foundation

enum OSVersion {

    case ios10
    case iosGreaterAndEqualTo11

    static var allCases: [OSVersion] { [.ios10, .iosGreaterAndEqualTo11] }
}
