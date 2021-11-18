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
protocol UIKitViewModelInput {

    func overrideFontSize(_ index: Int)
    func setOS(version: OSVersion)
}

// sourcery: AutoMockable
protocol UIKitViewModelOutput {

    var title: Driver<String> { get }
    var osVersion: Driver<String> { get }
    var fontName: Driver<String> { get }
    var lifecycle: Driver<String> { get }
    var caption: Driver<String> { get }
    var overrideFontTitle: Driver<String> { get }
    var overrideFontIsHidding: Driver<Bool> { get }
    var overrideFontScaleTitle: Driver<String> { get }
    var overrideFontSegmentOptions: Driver<[String]> { get }
    var overrideFontOnValue: BehaviorRelay<Int> { get }
    var overrideFontSliderOptions: Driver<[UIContentSizeCategory]> { get }
    var overrideFontSize: Driver<UIContentSizeCategory?> { get }
    var overrideFontSizeText: Driver<String> { get }
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
    var overrideFontTitle: Driver<String>
    var overrideFontIsHidding: Driver<Bool>
    var overrideFontScaleTitle: Driver<String>
    var overrideFontSegmentOptions: Driver<[String]>
    var overrideFontOnValue: BehaviorRelay<Int>
    var overrideFontSliderOptions: Driver<[UIContentSizeCategory]>
    var overrideFontSize: Driver<UIContentSizeCategory?>
    var overrideFontSizeText: Driver<String>

    private let overrideFontTrigger = PublishRelay<Bool>()
    private let overrideFontSizeTrigger = PublishRelay<UIContentSizeCategory?>()
    private let versionTrigger = BehaviorRelay<OSVersion>(value: .iosGreaterOrEqualTo11)
    private let overrideFontSizes: [UIContentSizeCategory] = [.small, .medium, .large, .extraLarge]

    private var recentOverrideFontSize: UIContentSizeCategory = .medium

    var input: UIKitViewModelInput { self }
    var output: UIKitViewModelOutput { self }

    private let disposeBag = DisposeBag()

    init() {
        title = versionTrigger
            .map { $0.title() }
            .asDriver(onErrorJustReturn: OSVersion.iosGreaterOrEqualTo11.title())
        osVersion = versionTrigger
            .map { $0.title() }
            .asDriver(onErrorJustReturn: OSVersion.iosGreaterOrEqualTo11.title())
        fontName = Driver.just(UIFont.ZenOldMincho.regular.fontName())
        lifecycle = Driver.just(Lifecycle.uiKit.title())
        caption = Driver.just(R.string.localizable.ios11UIKitCommentLabelTitle())
        overrideFontTitle = Driver.just(R.string.localizable.ios11UIKitOverrideFontTitleTitle())
        overrideFontScaleTitle = Driver.just(R.string.localizable.ios11UIKitOverrideFontScaleTitleTitle())
        overrideFontSegmentOptions = Driver.just(
            [
                R.string.localizable.ios11UIKitOverrideFontSegmentOptionsOn(),
                R.string.localizable.ios11UIKitOverrideFontSegmentOptionsOff()
            ]
        )
        overrideFontOnValue = BehaviorRelay<Int>(value: 0)
        overrideFontIsHidding = overrideFontOnValue.map { $0 != 1 }.asDriver(onErrorJustReturn: false)
        overrideFontSliderOptions = Driver.just(overrideFontSizes)
        overrideFontSize = overrideFontSizeTrigger.asDriver(onErrorJustReturn: .unspecified)
        overrideFontSizeText = overrideFontSizeTrigger
            .compactMap { $0?.label() }
            .asDriver(onErrorJustReturn: "")
        overrideFontOnValue.withUnretained(self)
            .subscribe { owner, value in
                if value == 0 {
                    owner.overrideFontSizeTrigger.accept(nil)
                } else {
                    owner.overrideFontSizeTrigger.accept(owner.recentOverrideFontSize)
                }
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UIKitViewModelInput

extension UIKitViewModel: UIKitViewModelInput {

    func overrideFontSize(_ index: Int) {
        recentOverrideFontSize = overrideFontSizes[index]
        overrideFontSizeTrigger.accept(overrideFontSizes[index])
    }

    func setOS(version: OSVersion) {
        versionTrigger.accept(version)
    }
}

// MARK: - UIKitViewModelOutput

extension UIKitViewModel: UIKitViewModelOutput {}
