//
//  UIKitViewModelSpec.swift
//  CustomDynamicFont
//
//  Created by Bliss on 17/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//
// swiftlint:disable closure_body_length

@testable import CustomDynamicFont
import Nimble
import Quick
import Resolver
import RxNimble
import RxSwift
import RxTest

final class UIKitViewModelSpec: QuickSpec {

    override func spec() {

        var viewModel: UIKitViewModel!
        var scheduler: TestScheduler!
        var disposeBag: DisposeBag!

        describe("a UIKitViewModel") {

            beforeEach {
                viewModel = UIKitViewModel()
                scheduler = TestScheduler(initialClock: 0)
                disposeBag = DisposeBag()
            }

            afterEach {
                scheduler = nil
            }

            context("when Initialized") {

                it("returns output with correct title") {
                    expect(viewModel.output.title)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(0, OSVersion.iosGreaterOrEqualTo11.title()), .completed(0)]))
                }

                it("returns output with correct osVersion") {
                    expect(viewModel.output.osVersion)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(0, OSVersion.iosGreaterOrEqualTo11.title()), .completed(0)]))
                }

                it("returns output with correct fontName") {
                    expect(viewModel.output.fontName)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(0, UIFont.ZenOldMincho.regular.fontName()), .completed(0)]))
                }

                it("returns output with correct lifecycle") {
                    expect(viewModel.output.lifecycle)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(0, Lifecycle.uiKit.title()), .completed(0)]))
                }

                it("returns output with correct caption") {
                    expect(viewModel.output.caption)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(0, R.string.localizable.ios11uikitCommentlabelTitle()), .completed(0)]))
                }
            }
        }
    }
}
