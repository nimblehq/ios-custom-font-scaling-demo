//
//  IOS10DynamicFontController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 18/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import UIKit

class IOS10DynamicFontController: UIViewController, DynamicFontController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpContentSizeNotification()
    }

    func updateFonts(notification _: Notification) {}

    deinit {
        removeContentSizeNotification()
    }
}
