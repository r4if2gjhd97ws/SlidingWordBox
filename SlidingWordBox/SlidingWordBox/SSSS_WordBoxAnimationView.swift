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

            // TODO: 星マーク
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
        GeometryReader { geometry in
            HStack {
                ForEach(SlidingWordType.allCases, id: \.self) { word in
                    VStack {
                        Spacer()
                            .frame(height: CGFloat.random(in: 0...geometry.size.height / 3))
                        SSSS_WordBox(word.text)
                        Spacer()
                    }
                }
            }
                .background(.cyan)
                .frame(maxWidth: .infinity)
        }
    }
}



struct SSSS_WordBoxContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray)
            SSSS_WordBoxContainerView()
        }
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
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                container
                centerLine(geometry.size)
            }
        }
    }


    private var container: some View {
        SSSS_WordBoxContainerView()
            .offset(x: isAnimationActive ? UIScreen.main.bounds.width : -UIScreen.main.bounds.width)
            .animation(Animation.linear(duration: 6).repeatForever(autoreverses: false), value: isAnimationActive)

    }



    private func centerLine(_ size: CGSize) -> some View {

        Rectangle()
            .fill(Color.white)
            .frame(width: 2, height: size.height)
    }

}


class SlidingUtil {
    static let durationSec = 10 // 秒
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    static func startAfter() {


    }
}


/***
 duration = 10
 pill_width = 100
 screen_width = 1000
 進ませる距離 = screen_width + pill_width = 1100
 [1pt / duration] = duration / 進ませる距離
 pill filling duration = [1pt / duration] x pill_width
 
 
 
 let duration = 10
 let 進ませる距離 = screen_width + pill_width
 let durationPer1pt = duration / 進ませる距離
 animate(duration: duration, option: .curveLiner) {
 pill.x += 進ませる距離
 }
 
 animate(duration: pill_width * durationPer1pt, delay: screen_width / 2 * durationPer1pt, option: .curveLiner) {
 // バックグラウンドカラーの表示
 }
 
 
 
 画面の左端から、右端までscreen_width分だけ動かしても、左側が見えたままなのでプラスでpill_width分さらに動かさないといけないのではと思い、上記に修正してみました
 */
