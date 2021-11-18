//
//  IOS11UIKitViewController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 10/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Resolver
import RxSwift
import UIKit

final class IOS11UIKitViewController: UIViewController {

    private var uiKitView: UIKitView?

    private let disposeBag = DisposeBag()

    @Injected private var viewModel: UIKitViewModelProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        bindViewModel()
    }
}

// MARK: - Private

extension IOS11UIKitViewController {

    private func setUpLayout() {
        let uiKitView = UIKitView(viewModel: viewModel)
        view.addSubview(uiKitView)

        uiKitView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.uiKitView = uiKitView
    }

    private func bindViewModel() {
        viewModel.output.title.drive(rx.title)
            .disposed(by: disposeBag)
    }
}
