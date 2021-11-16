//
//  SelectOSViewModelSpec.swift
//  CustomDynamicFont
//
//  Created by Bliss on 15/11/21.
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

final class SelectOSViewModelSpec: QuickSpec {

    override func spec() {

        var viewModel: SelectOSViewModel!
        var scheduler: TestScheduler!
        var disposeBag: DisposeBag!

        describe("a SelectOSViewModel") {

            beforeEach {
                viewModel = SelectOSViewModel()
                scheduler = TestScheduler(initialClock: 0)
                disposeBag = DisposeBag()
            }

            afterEach {
                scheduler = nil
            }

            context("when input selectVersion is called with an existing index") {

                context("when index is 0") {

                    it("returns output with correct OSVersion") {
                        scheduler.scheduleAt(50) {
                            viewModel.input.selectVersion(0)
                        }

                        expect(viewModel.output.didSelectVersion)
                            .events(scheduler: scheduler, disposeBag: disposeBag)
                            .to(equal([.next(50, OSVersion.allCases[0])]))
                    }
                }
                context("when index is 1") {

                    it("returns output with correct OSVersion when index is not 0") {
                        scheduler.scheduleAt(50) {
                            viewModel.input.selectVersion(1)
                        }

                        expect(viewModel.output.didSelectVersion)
                            .events(scheduler: scheduler, disposeBag: disposeBag)
                            .to(equal([.next(50, OSVersion.allCases[1])]))
                    }
                }
            }

            context("when input selectVersion is called with a non existing index") {

                it("returns output with no object") {
                    scheduler.scheduleAt(50) {
                        viewModel.input.selectVersion(-1)
                    }

                    expect(viewModel.output.didSelectVersion)
                        .events(scheduler: scheduler, disposeBag: disposeBag)
                        .to(equal([]))
                }
            }
        }
    }
}
