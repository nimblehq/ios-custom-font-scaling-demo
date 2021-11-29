//
//  UIKitViewModelSpec.swift
//  CustomDynamicFont
//
//  Created by Bliss on 17/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//
// swiftlint:disable closure_body_length function_body_length

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
                        .to(equal([.next(0, R.string.localizable.ios11UIKitCommentLabelTitle()), .completed(0)]))
                }

                it("returns output with correct overrideFontTitle") {
                    expect(viewModel.output.overrideFontTitle)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(0, R.string.localizable.ios11UIKitOverrideFontTitleTitle()), .completed(0)]))
                }

                it("returns output with correct overrideFontScaleTitle") {
                    expect(viewModel.output.overrideFontScaleTitle)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([
                            .next(0, R.string.localizable.ios11UIKitOverrideFontScaleTitleTitle()),
                            .completed(0)
                        ]))
                }

                it("returns output with correct overrideFontSegmentOptions") {
                    expect(viewModel.output.overrideFontSegmentOptions)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([
                            .next(
                                0,
                                [
                                    R.string.localizable.ios11UIKitOverrideFontSegmentOptionsOn(),
                                    R.string.localizable.ios11UIKitOverrideFontSegmentOptionsOff()
                                ]
                            ),
                            .completed(0)
                        ]))
                }

                it("returns output with correct overrideFontSliderOptions") {
                    expect(viewModel.output.overrideFontSliderOptions)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(0, [.small, .medium, .large, .extraLarge]), .completed(0)]))
                }
            }

            context("when output overrideFontOnValue is changed") {

                it("set correct value to output overrideFontIsHidding") {
                    scheduler.scheduleAt(50) {
                        viewModel.output.overrideFontOnValue.accept(1)
                    }
                    scheduler.scheduleAt(100) {
                        viewModel.output.overrideFontOnValue.accept(0)
                    }

                    expect(viewModel.output.overrideFontIsHidding)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(0, true), .next(50, false), .next(100, true)]))
                }

                it("set correct value to output overrideFontSize") {
                    scheduler.scheduleAt(50) {
                        viewModel.output.overrideFontOnValue.accept(1)
                    }
                    scheduler.scheduleAt(100) {
                        viewModel.output.overrideFontOnValue.accept(0)
                    }

                    expect(viewModel.output.overrideFontSize)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(50, .medium), .next(100, nil)]))
                }
            }

            context("when input overrideFontSize is called") {

                it("returns output overrideFontSize with correct value") {
                    scheduler.scheduleAt(50) {
                        viewModel.input.overrideFontSize(0)
                    }

                    expect(viewModel.output.overrideFontSize)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(50, .small)]))
                }

                it("returns output overrideFontSizeText with correct value") {
                    scheduler.scheduleAt(50) {
                        viewModel.input.overrideFontSize(0)
                    }

                    expect(viewModel.output.overrideFontSizeText)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([.next(50, UIContentSizeCategory.small.label())]))
                }
            }
        }
    }
}
