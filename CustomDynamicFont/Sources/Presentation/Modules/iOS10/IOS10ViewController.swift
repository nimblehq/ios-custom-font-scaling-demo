//
//  IOS10ViewController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 10/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Resolver
import RxSwift
import UIKit

final class IOS10ViewController: IOS10DynamicFontController {

    private var uiKitView: UIKitView?
    private var fontSize: UIContentSizeCategory?

    @Injected private var viewModel: UIKitViewModelProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        bindViewModel()
    }

    override func updateFonts(notification _: Notification) {
        uiKitView?.setUpFont(fontSize: fontSize)
    }
}

// MARK: - Private

extension IOS10ViewController {

    private func setUpLayout() {
        let uiKitView = UIKitView(viewModel: viewModel)
        view.addSubview(uiKitView)

        uiKitView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.uiKitView = uiKitView
    }

    private func bindViewModel() {
        viewModel.input.setOS(version: .ios10)
        viewModel.output.title.drive(rx.title)
            .disposed(by: disposeBag)
        viewModel.output.overrideFontSize
            .asObservable()
            .withUnretained(self)
            .subscribe { owner, value in
                owner.fontSize = value
            }
            .disposed(by: disposeBag)
    }
}
