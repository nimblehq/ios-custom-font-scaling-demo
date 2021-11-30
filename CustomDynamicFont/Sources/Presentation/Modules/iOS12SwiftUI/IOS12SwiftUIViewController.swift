//
//  IOS12SwiftUIViewController.swift
//  CustomDynamicFont
//
//  Created by Bliss on 10/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import SwiftUI
import UIKit

@available(iOS 13.0, *)
final class IOS12SwiftUIViewController: UIHostingController<DynamicFontSwiftUIView> {

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(rootView: DynamicFontSwiftUIView) {
        super.init(rootView: rootView)
        setUpView()
    }

    private func setUpView() {
        tabBarItem.title = Lifecycle.swiftUI.title()
        tabBarItem.image = R.image.star()
        tabBarItem.selectedImage = R.image.starFill()
    }
}
