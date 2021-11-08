//
//  MainNavigationController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font:
                UIFont.customFont(UIFont.ZenOldMincho.regular, forTextStyle: .caption1) ??
                .systemFont(ofSize: 14)
        ]
    }
}
