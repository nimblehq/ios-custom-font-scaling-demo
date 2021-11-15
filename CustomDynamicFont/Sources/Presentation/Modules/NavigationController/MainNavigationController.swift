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
            .font:
                UIFont.customFont(UIFont.ZenOldMincho.regular, forTextStyle: .title3) ??
                .systemFont(ofSize: 14)
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [
                .font:
                    UIFont.customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body) ??
                    .systemFont(ofSize: 14)
            ],
            for: .normal
        )
    }
}
