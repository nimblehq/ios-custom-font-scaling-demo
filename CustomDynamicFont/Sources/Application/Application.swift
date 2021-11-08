//
//  Application.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import IQKeyboardManagerSwift
import Resolver
import UIKit

final class Application {

    @Injected private var navigator: Navigatable

    func presentInitialScreen(in window: UIWindow?) {
        let selectOSViewModel = Resolver.resolve(SelectOSViewModelProtocol.self)
        let initialScene: Navigator.Scene
        initialScene = .selectOS(viewModel: selectOSViewModel)
        navigator.show(scene: initialScene, sender: nil, transition: .root(window: window))
    }
}

// MARK: - Singleton

extension Application {

    static let shared = Application()
}
