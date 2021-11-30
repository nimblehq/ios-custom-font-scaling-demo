//
//  DynamicFontController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 17/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import RxSwift
import UIKit

protocol DynamicFontController {

    func setUpContentSizeNotification(disposeBag: DisposeBag)
    func updateFonts(notification: Notification)
}

extension DynamicFontController where Self: UIViewController {

    func setUpContentSizeNotification(disposeBag: DisposeBag) {
        NotificationCenter.default.rx.notification(UIContentSizeCategory.didChangeNotification, object: nil)
            .withUnretained(self)
            .take(until: rx.deallocated)
            .subscribe { owner, value in
                owner.updateFonts(notification: value)
            }
            .disposed(by: disposeBag)
    }
}
