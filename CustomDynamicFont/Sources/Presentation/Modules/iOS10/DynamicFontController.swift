//
//  DynamicFontController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 17/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

protocol DynamicFontController {

    func setUpContentSizeNotification()
    func removeContentSizeNotification()
    func updateFonts(notification: Notification)
}

extension DynamicFontController where Self: UIViewController {

    func setUpContentSizeNotification() {
        NotificationCenter.default.addObserver(
            forName: UIContentSizeCategory.didChangeNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            self?.updateFonts(notification: notification)
        }
    }

    func removeContentSizeNotification() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIContentSizeCategory.didChangeNotification,
            object: nil
        )
    }
}
