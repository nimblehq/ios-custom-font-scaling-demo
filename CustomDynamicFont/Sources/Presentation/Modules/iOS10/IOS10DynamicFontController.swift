//
//  IOS10DynamicFontController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 18/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import RxSwift
import UIKit

class IOS10DynamicFontController: UIViewController, DynamicFontController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpContentSizeNotification(disposeBag: disposeBag)
    }

    func updateFonts(notification _: Notification) {}
}
