//
//  DynamicFontSwiftUIView.swift
//  CustomDynamicFont
//
//  Created by Bliss on 29/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct DynamicFontSwiftUIView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 8.0) {
                Image(uiImage: R.image.color_Rectangle() ?? UIImage())
                    .resizable()
                    .frame(width: 260.0, height: 260.0)
                    .padding(.bottom, 12.0)
                Text(UIFont.ZenOldMincho.regular.fontName())
                    .scaledFont(font: UIFont.ZenOldMincho.bold, forTextStyle: .headline)
                Text(R.string.localizable.osVersionIos13Title())
                    .scaledFont(font: UIFont.ZenOldMincho.regular, forTextStyle: .body)
                Text(R.string.localizable.ios12SwiftUILifecycleLabelTitle())
                    .scaledFont(font: UIFont.ZenOldMincho.regular, forTextStyle: .body)
                Text(R.string.localizable.ios11UIKitCommentLabelTitle())
                    .scaledFont(font: UIFont.ZenOldMincho.regular, forTextStyle: .footnote)
            }
            .padding([.top, .bottom], 20.0)
        }
    }
}

@available(iOS 13.0.0, *)
struct DynamicFontSwiftUIView_Previews: PreviewProvider {

    static var previews: some View {
        DynamicFontSwiftUIView()
    }
}
