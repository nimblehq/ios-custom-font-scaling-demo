//  swiftlint:disable:this file_name
//  UIFont+DynamicFontIOS10.swift
//  CustomDynamicFont
//
//  Created by Bliss on 18/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

protocol DynamicFontIOS10 {

    func font(for style: UIFont.TextStyle, sizeCategory: UIContentSizeCategory) -> UIFont?
}
