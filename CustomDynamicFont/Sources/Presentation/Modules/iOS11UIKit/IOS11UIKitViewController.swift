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

    private let imageView = UIImageView()
    private let fontNameLabel = UILabel()
    private let versionLabel = UILabel()
    private let lifecycleLabel = UILabel()
    private let commentLabel = UILabel()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()

    private let disposeBag = DisposeBag()

    @Injected private var viewModel: UIKitViewModelProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setUpViews()
        bindViewModel()
    }
}

// MARK: - Private

extension IOS11UIKitViewController {

    private func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(imageView, stackView)
        stackView.addArrangedSubviews(
            fontNameLabel,
            versionLabel,
            lifecycleLabel,
            commentLabel
        )

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
        }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.size.equalTo(CGSize(width: 260.0, height: 260.0))
            $0.centerX.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20.0)
            $0.leading.trailing.bottom.equalToSuperview().inset(20.0)
        }
    }

    private func setUpViews() {
        view.backgroundColor = .white

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8.0

        fontNameLabel.textAlignment = .center
        versionLabel.textAlignment = .center
        lifecycleLabel.textAlignment = .center
        commentLabel.textAlignment = .center

        fontNameLabel.numberOfLines = 0
        versionLabel.numberOfLines = 0
        lifecycleLabel.numberOfLines = 0
        commentLabel.numberOfLines = 0

        fontNameLabel.font = .customFont(UIFont.ZenOldMincho.bold, forTextStyle: .headline)
        versionLabel.font = .customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body)
        lifecycleLabel.font = .customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body)
        commentLabel.font = .customFont(UIFont.ZenOldMincho.regular, forTextStyle: .footnote)

        imageView.image = R.image.color_Rectangle()
    }

    private func bindViewModel() {
        viewModel.output.title.drive(rx.title)
            .disposed(by: disposeBag)
        viewModel.output.fontName.drive(fontNameLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.output.osVersion.drive(versionLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.output.lifecycle.drive(lifecycleLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.output.caption.drive(commentLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
