//
//  DynamicFontSwiftUIView.swift
//  CustomDynamicFont
//
//  Created by Bliss on 29/11/21.
//  Copyright © 2021 Nimble. All rights reserved.
//
// swiftlint:disable closure_body_length

import Combine
import SwiftUI

@available(iOS 13.0.0, *)
struct DynamicFontSwiftUIView: View {

    @State private var fontSliderValue: Double = 1.0
    @State private var selectedOverrideOption: OverridingFont = .isOff
    @State private var fontSize: ContentSizeCategory?
    private let overrideFontSizes: [ContentSizeCategory] = [.small, .medium, .large, .extraLarge]
    private let overridingFontOptions: [OverridingFont] = [.isOff, .isOn]

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 8.0) {
                Image(uiImage: R.image.color_Rectangle() ?? UIImage())
                    .resizable()
                    .frame(width: 260.0, height: 260.0)
                Spacer(minLength: 4.0)
                Text(UIFont.ZenOldMincho.regular.fontName())
                    .scaledFont(font: UIFont.ZenOldMincho.bold, forTextStyle: .headline, overrideFontSize: fontSize)
                Text(R.string.localizable.osVersionIos13Title())
                    .scaledFont(font: UIFont.ZenOldMincho.regular, forTextStyle: .body, overrideFontSize: fontSize)
                Text(R.string.localizable.ios12SwiftUILifecycleLabelTitle())
                    .scaledFont(font: UIFont.ZenOldMincho.regular, forTextStyle: .body, overrideFontSize: fontSize)
                Text(R.string.localizable.ios11UIKitCommentLabelTitle())
                    .scaledFont(font: UIFont.ZenOldMincho.regular, forTextStyle: .footnote, overrideFontSize: fontSize)
                Spacer(minLength: 4.0)

                HStack {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(R.string.localizable.ios11UIKitOverrideFontScaleTitleTitle())
                            .scaledFont(
                                font: UIFont.ZenOldMincho.regular,
                                forTextStyle: .body,
                                overrideFontSize: fontSize
                            )
                        Picker(
                            selection: $selectedOverrideOption,
                            content: {
                                ForEach(overridingFontOptions, id: \.self) {
                                    Text($0.title()).tag($0)
                                }
                            },
                            label: {}
                        )
                        .pickerStyle(.segmented)

                        if selectedOverrideOption == .isOn {
                            Spacer(minLength: 4.0)

                            Text(R.string.localizable.ios11UIKitOverrideFontTitleTitle())
                                .scaledFont(
                                    font: UIFont.ZenOldMincho.regular,
                                    forTextStyle: .body,
                                    overrideFontSize: fontSize
                                )
                            HStack(spacing: 8.0) {
                                Slider(
                                    value: $fontSliderValue,
                                    in: 0 ... Double(overrideFontSizes.count - 1),
                                    step: 1.0
                                ) { _ in
                                    fontSize = overrideFontSizes[Int(fontSliderValue)]
                                }
                                if let fontSize = fontSize {
                                    Text(fontSize.label())
                                        .scaledFont(
                                            font: UIFont.ZenOldMincho.regular,
                                            forTextStyle: .body,
                                            overrideFontSize: fontSize
                                        )
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 16.0)
            .padding([.top, .bottom], 20.0)
            .onReceive(Just(selectedOverrideOption), perform: { value in
                fontSize = value == .isOn ? overrideFontSizes[Int(fontSliderValue)] : nil
            })
        }
    }
}

@available(iOS 13.0.0, *)
struct DynamicFontSwiftUIView_Previews: PreviewProvider {

    static var previews: some View {
        DynamicFontSwiftUIView()
    }
}
