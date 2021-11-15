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

    private let overrideFontSectionLabel = UILabel()
    private let overrideFontSegment = UISegmentedControl()
    private let overrideFontSlider = UISlider()
    private let overrideFontLabel = UILabel()
    private let overrideFontScaleSectionLabel = UILabel()
    private let overrideFontStackView = UIStackView()
    private let overrideFontSliderStackView = UIStackView()

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
        contentView.addSubviews(
            imageView,
            stackView,
            overrideFontStackView
        )
        stackView.addArrangedSubviews(
            fontNameLabel,
            versionLabel,
            lifecycleLabel,
            commentLabel,
            overrideFontLabel,
            overrideFontSegment
        )

        overrideFontStackView.addArrangedSubviews(
            overrideFontScaleSectionLabel,
            overrideFontSliderStackView
        )

        overrideFontSliderStackView.addArrangedSubviews(
            overrideFontSlider,
            overrideFontSectionLabel
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
            $0.leading.trailing.equalToSuperview().inset(20.0)
        }

        overrideFontStackView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(20.0)
            $0.leading.trailing.bottom.equalToSuperview().inset(20.0)
        }

        overrideFontLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
        }

        overrideFontSegment.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
    }

    private func setUpViews() {
        view.backgroundColor = .white

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8.0

        overrideFontStackView.axis = .vertical
        overrideFontStackView.distribution = .fill
        overrideFontStackView.spacing = 8.0

        overrideFontSliderStackView.spacing = 8.0

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

        overrideFontLabel.font = .customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body)
        overrideFontSectionLabel.font = .customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body)
        overrideFontScaleSectionLabel.font = .customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body)
        // TODO: Replace in integration
        overrideFontLabel.text = "placeholder"
        overrideFontSectionLabel.text = "placeholder"
        overrideFontScaleSectionLabel.text = "placeholder"
        overrideFontSegment.insertSegment(withTitle: "1", at: 0, animated: false)
        overrideFontSegment.insertSegment(withTitle: "2", at: 1, animated: false)

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
