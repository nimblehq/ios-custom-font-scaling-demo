//
//  UIFont+CustomFont.swift
//  CustomDynamicFont
//
//  Created by Bliss on 5/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

extension UIFont {

    enum ZenOldMincho: String {

        case regular = "ZenOldMincho-Regular"
        case bold = "ZenOldMincho-Bold"

        func size(_ size: CGFloat) -> UIFont? {
            UIFont(name: rawValue, size: size)
        }
    }
}
