//
//  UIKitViewModel.swift
//  CustomDynamicFont
//
//  Created by Bliss on 15/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Foundation
import Resolver
import RxCocoa
import RxSwift

// sourcery: AutoMockable
protocol UIKitViewModelInput {}

// sourcery: AutoMockable
protocol UIKitViewModelOutput {

    var title: Driver<String> { get }
    var osVersion: Driver<String> { get }
    var fontName: Driver<String> { get }
    var lifecycle: Driver<String> { get }
    var caption: Driver<String> { get }
}

// sourcery: AutoMockable
protocol UIKitViewModelProtocol: AnyObject {

    var input: UIKitViewModelInput { get }
    var output: UIKitViewModelOutput { get }
}

final class UIKitViewModel: UIKitViewModelProtocol {

    var title: Driver<String>
    var osVersion: Driver<String>
    var fontName: Driver<String>
    var lifecycle: Driver<String>
    var caption: Driver<String>

    var input: UIKitViewModelInput { self }
    var output: UIKitViewModelOutput { self }

    private let disposeBag = DisposeBag()

    init() {
        title = Driver.just(OSVersion.iosGreaterOrEqualTo11.title())
        osVersion = Driver.just(OSVersion.iosGreaterOrEqualTo11.title())
        fontName = Driver.just(UIFont.ZenOldMincho.regular.fontName())
        lifecycle = Driver.just(Lifecycle.uiKit.title())
        caption = Driver.just(R.string.localizable.ios11uikitCommentlabelTitle())
    }
}

// MARK: - UIKitViewModelInput

extension UIKitViewModel: UIKitViewModelInput {}

// MARK: - UIKitViewModelOutput

extension UIKitViewModel: UIKitViewModelOutput {}
