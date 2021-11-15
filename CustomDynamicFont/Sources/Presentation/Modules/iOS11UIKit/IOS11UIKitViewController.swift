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

        setUpFont(fontSize: nil)

        imageView.image = R.image.color_Rectangle()
    }

    func setUpFont(fontSize: UIContentSizeCategory?) {
        UIView.setAutoAdjustFont(
            fontNameLabel,
            versionLabel,
            lifecycleLabel,
            commentLabel,
            overrideFontLabel,
            overrideFontSectionLabel,
            overrideFontScaleSectionLabel,
            on: fontSize == nil
        )
        fontNameLabel.font = .customFont(UIFont.ZenOldMincho.bold, forTextStyle: .headline, overrideFontSize: fontSize)
        versionLabel.font = .customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body, overrideFontSize: fontSize)
        lifecycleLabel.font = .customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body, overrideFontSize: fontSize)
        commentLabel.font = .customFont(
            UIFont.ZenOldMincho.regular,
            forTextStyle: .footnote,
            overrideFontSize: fontSize
        )

        overrideFontLabel.font = .customFont(
            UIFont.ZenOldMincho.regular,
            forTextStyle: .body,
            overrideFontSize: fontSize
        )
        overrideFontSectionLabel.font = .customFont(
            UIFont.ZenOldMincho.regular,
            forTextStyle: .body,
            overrideFontSize: fontSize
        )
        overrideFontScaleSectionLabel.font = .customFont(
            UIFont.ZenOldMincho.regular,
            forTextStyle: .body,
            overrideFontSize: fontSize
        )
    }

    private func bindViewModel() {
        bindViewModelLabels()
        bindViewModelActions()
    }

    private func bindViewModelLabels() {
        overrideFontSegment.rx.selectedSegmentIndex
            .bind(to: viewModel.output.overrideFontOnValue)
            .disposed(by: disposeBag)

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
        viewModel.output.overrideFontIsHidding.drive(overrideFontScaleSectionLabel.rx.isHidden)
            .disposed(by: disposeBag)
        viewModel.output.overrideFontIsHidding.drive(overrideFontSliderStackView.rx.isHidden)
            .disposed(by: disposeBag)
        viewModel.output.overrideFontTitle.drive(overrideFontLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.output.overrideFontScaleTitle.drive(overrideFontScaleSectionLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.output.overrideFontSizeText.drive(overrideFontSectionLabel.rx.text)
            .disposed(by: disposeBag)
    }

    private func bindViewModelActions() {
        viewModel.output.overrideFontSegmentOptions.drive(with: self) {
            let overrideFontSegment = $0.overrideFontSegment
            overrideFontSegment.removeAllSegments()
            $1.forEach { title in
                overrideFontSegment.insertSegment(withTitle: title, at: 0, animated: false)
            }
            overrideFontSegment.selectedSegmentIndex = 0
        }
        .disposed(by: disposeBag)
        viewModel.output.overrideFontSliderOptions.drive(with: self) {
            let overrideSlider = $0.overrideFontSlider
            overrideSlider.minimumValue = 0
            overrideSlider.maximumValue = Float($1.count - 1)
        }
        .disposed(by: disposeBag)
        overrideFontSlider.rx.value
            .withUnretained(self)
            .subscribe { owner, value in
                let rounded = roundf(value)
                owner.overrideFontSlider.value = rounded
                owner.viewModel.input.overrideFontSize(Int(rounded))
            }
            .disposed(by: disposeBag)
        viewModel.output.overrideFontSize.drive(with: self) {
            $0.setUpFont(fontSize: $1)
        }
        .disposed(by: disposeBag)
    }
}
