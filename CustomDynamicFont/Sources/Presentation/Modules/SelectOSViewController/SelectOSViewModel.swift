//
//  SelectOSViewModel.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Foundation
import Resolver
import RxCocoa
import RxSwift

// sourcery: AutoMockable
protocol SelectOSViewModelInput {

    func selectVersion(_ index: Int)
}

// sourcery: AutoMockable
protocol SelectOSViewModelOutput {

    var items: Driver<[String]> { get }
    var didSelectVersion: Driver<OSVersion> { get }
}

// sourcery: AutoMockable
protocol SelectOSViewModelProtocol: AnyObject {

    var input: SelectOSViewModelInput { get }
    var output: SelectOSViewModelOutput { get }
}

final class SelectOSViewModel: SelectOSViewModelProtocol {

    var input: SelectOSViewModelInput { self }
    var output: SelectOSViewModelOutput { self }

    var items: Driver<[String]>
    var didSelectVersion: Driver<OSVersion>

    private let selectVersionTrigger = PublishRelay<Int>()

    private let disposeBag = DisposeBag()

    init() {
        let versions = OSVersion.allCases

        items = Driver.just(versions.map { $0.title() })

        didSelectVersion = selectVersionTrigger
            .filter { $0 >= 0 && $0 < versions.count }
            .map { index -> OSVersion in
                let version = versions[index]
                return Resolver.resolve(OSVersion.self, args: version)
            }
            .asDriver(onErrorJustReturn: .ios10)
    }
}

// MARK: - HomeViewModelInput

extension SelectOSViewModel: SelectOSViewModelInput {

    func selectVersion(_ index: Int) {
        selectVersionTrigger.accept(index)
    }
}

// MARK: - HomeViewModelOutput

extension SelectOSViewModel: SelectOSViewModelOutput {}
