//
//  MainTabBarController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 29/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override var selectedIndex: Int {
        didSet {
            guard let selectedViewController = viewControllers?[selectedIndex] else {
                return
            }
            selectedViewController.tabBarItem.setTitleTextAttributes(
                [
                    .font: UIFont.customFont(UIFont.ZenOldMincho.bold, forTextStyle: .caption1) ??
                        .boldSystemFont(ofSize: 12.0)
                ],
                for: .normal
            )
        }
    }

    override var selectedViewController: UIViewController? {
        didSet {
            setFont()
        }
    }

    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        setFont()
    }

    private func setFont() {
        for viewController in viewControllers ?? [] {
            if viewController == selectedViewController {
                viewController.tabBarItem.setTitleTextAttributes(
                    [
                        .font: UIFont.customFont(UIFont.ZenOldMincho.bold, forTextStyle: .caption1) ??
                            .boldSystemFont(ofSize: 12.0)
                    ],
                    for: .normal
                )
            } else {
                viewController.tabBarItem.setTitleTextAttributes(
                    [
                        .font: UIFont.customFont(UIFont.ZenOldMincho.regular, forTextStyle: .caption1) ??
                            .systemFont(ofSize: 12.0)
                    ],
                    for: .normal
                )
            }
        }
    }
}
