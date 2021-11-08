//
//  Resolver+ResolverRegistering.swift
//  CustomDynamicFont
//
//  Created by Bliss on 8/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import Resolver

extension Resolver: ResolverRegistering {

    public static func registerAllServices() {
        registerPresentationServices()
    }
}
