//
//  RoundedRectangleWithText.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/09.
//

import Foundation
import SwiftUI

// 以下のソースコードを前提に、
// SSSS_WordBoxCircleを画面のcenterXより右にはみ出たら白色に塗りつぶしてください

struct SSSS_WordBox: View {
    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        VStack {
            SSSS_WordBoxCircle()
                .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.red, lineWidth: 1)
            )
                .frame(width: self.width, height: 27)
            Text(text)
                .font(.system(size: 20))
                .padding(.horizontal, 16)
                .background(GeometryReader { textGeometry in
                Color.clear
                    .preference(key: WidthPreferenceKey.self, value: textGeometry.size.width)
            })
        }
            .background(.yellow)
            .onPreferenceChange(WidthPreferenceKey.self) { width in
            self.width = width
        }
    }

    @State private var width: CGFloat = 0

    struct WidthPreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
}

struct SSSS_WordBoxCircle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.blue)

    }
}

struct SSSS_WordBoxContainerView: View {

    var body: some View {
        HStack {
            ForEach(SlidingWordType.allCases, id: \.self) { word in
                SSSS_WordBox(word.text)
            }
        }
            .background(.cyan)
            .frame(maxWidth: .infinity)
    }
}

struct SSSS_WordBoxAnimationView: View {
    let text: String
    @Binding private var isAnimationActive: Bool
    @State private var width: CGFloat = 0

    init(_ text: String, isAnimationActive: Binding<Bool>) {
        self.text = text
        _isAnimationActive = isAnimationActive
    }

    var body: some View {
        SSSS_WordBoxContainerView()
            .offset(x: isAnimationActive ? UIScreen.main.bounds.width : -UIScreen.main.bounds.width)
            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: isAnimationActive)
            .background(GeometryReader { textGeometry in
        })
    }
}

