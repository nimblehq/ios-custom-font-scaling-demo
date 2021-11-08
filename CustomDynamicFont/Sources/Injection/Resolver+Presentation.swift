//
//  Resolver+Presentation.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Resolver

extension Resolver {

    static func registerPresentationServices() {
        registerViewModels()
        registerNavigation()
    }

    private static func registerViewModels() {
        register(SelectOSViewModelProtocol.self) { SelectOSViewModel() }
    }

    private static func registerNavigation() {
        register(Navigatable.self) { Navigator() }.scope(.application)
    }
}
