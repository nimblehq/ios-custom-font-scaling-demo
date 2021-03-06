//
//  SelectOSViewController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import RxDataSources
import RxSwift
import SnapKit
import UIKit

final class SelectOSViewController: UIViewController {

    private let tableView = UITableView()
    private let disposeBag = DisposeBag()

    private let viewModel: SelectOSViewModelProtocol

    private let osVersionCellIdentifier = "OSVersionCell"

    private weak var navigator: Navigatable?

    init(viewModel: SelectOSViewModelProtocol, navigator: Navigatable) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setUpViews()
        bindViewModel()
    }

    private func setUpLayout() {
        view.addSubviews(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setUpViews() {
        view.backgroundColor = .white
        title = R.string.localizable.selectOSNavigationTitle()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: osVersionCellIdentifier)
    }

    private func bindViewModel() {
        viewModel.output.items.drive(tableView.rx.items(cellIdentifier: osVersionCellIdentifier)) { _, model, cell in
            cell.textLabel?.font = UIFont.customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body)
            cell.textLabel?.text = model
        }
        .disposed(by: disposeBag)

        viewModel.output.didSelectVersion
            .drive(with: self) {
                let scene: Navigator.Scene
                switch $1 {
                case .ios10:
                    scene = .iOS10
                case .iosGreaterOrEqualTo11:
                    scene = .iOS11Tabbar
                }
                $0.navigator?.show(scene: scene, sender: self, transition: .navigation)
            }
            .disposed(by: disposeBag)

        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

extension SelectOSViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.input.selectVersion(indexPath.row)
    }
}
