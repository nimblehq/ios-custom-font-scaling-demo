//
//  UIView+AdjustFont.swift
//  CustomDynamicFont
//
//  Created by Bliss on 15/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

extension UIView {

    static func setAutoAdjustFont(_ views: UIView..., on: Bool = true) {
        views.forEach {
            if let view = $0 as? UILabel {
                view.adjustsFontForContentSizeCategory = on
            }
        }
    }
}

