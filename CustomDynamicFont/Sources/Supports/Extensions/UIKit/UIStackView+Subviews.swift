//
//  UIStackView+Subviews.swift
//  CustomDynamicFont
//
//  Created by Bliss on 12/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

extension UIStackView {

    func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview)
    }
}
