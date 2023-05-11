//
//  RoundedRectangleWithText.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/09.
//

import Foundation
import SwiftUI

struct SSSS_WordBox: View {
  let text: String
  @Binding var isAnimating: Bool
  @State private var pillWidth: CGFloat = 0

  let margin: CGFloat = 16

  init(_ text: String, isAnimating: Binding<Bool>) {
    self.text = text
    _isAnimating = isAnimating
  }

  var body: some View {
    VStack {
      HStack {
        SSSS_WordBoxCircle(isAnimating: $isAnimating, pillWidth: $pillWidth)
          .frame(width: self.pillWidth, height: 27)
      }
      Text(text)
        .frame(height: 20)
        .background(.cyan)
        .font(.system(size: 20))
        .background(GeometryReader { textGeometry in
        Color.clear
          .preference(key: WidthPreferenceKey.self, value: textGeometry.size.width)
      })

      // TODO: 星マーク
      Text("☆")
    }
      .background(.yellow)
      .onPreferenceChange(WidthPreferenceKey.self) { width in
      self.pillWidth = width + margin * 2
      print("\(text): \(width)")
    }
  }

  struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
      value = nextValue()
    }
  }
}

struct SSSS_WordBoxCircle: View {
  @State private var coverOffset: CGFloat = 0
  var isAnimating: Bool = false
  @Binding var pillWidth: CGFloat

  init(isAnimating: Binding<Bool>, pillWidth: Binding<CGFloat>) {
    self.isAnimating = isAnimating.wrappedValue
    _pillWidth = pillWidth
  }

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        // 白い内側背景
        RoundedRectangle(cornerRadius: 14)
          .fill(Color.clear)
          .overlay(
          Rectangle()
            .fill(Color.white)
//            .position(x: coverOffset, y: 0)
              .offset(x: coverOffset)
//              .id(coverOffset)
          .animation(isAnimating ? .linear(duration: 1) : .none, value: coverOffset)
            .onAppear {
            if isAnimating {
              startAnimation(geometry)
            }
          })
        // 外枠
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(Color.red, lineWidth: 1)
        )
      }
      //        .clipped()
      .onAppear {
        coverOffset = pillWidth
//        / 2

        print("\(pillWidth)")
      }
        .onChange(of: isAnimating) { newValue in
        if newValue {
          startAnimation(geometry)
        }
      }
    }
  }

  private func startAnimation(_ geometry: GeometryProxy) {

    //      coverOffset = geometry.frame(in: .local).minX

//    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      //      isAnimating = false
      withAnimation(.linear(duration: 0.7)) {
        coverOffset = 0


//      }
    }
  }
}

struct SSSS_WordBoxContainerView: View {
  @Binding var isAnimating: Bool

  var body: some View {
    GeometryReader { geometry in
      HStack {
        ForEach(SlidingWordType.allCases, id: \.self) { word in
          VStack {
            Spacer()
              .frame(height: word.yValue)
              .frame(maxWidth: .infinity)
            SSSS_WordBox(word.text, isAnimating: $isAnimating)
          }
        }
          .frame(maxWidth: .infinity)
      }
    }
  }

  private func randomHeight(height: CGFloat) -> CGFloat {
    let r = CGFloat.random(in: 0...height / 3)
    print("randomHeight: \(r)")
    return r
  }
}

struct SSSS_WordBoxContainerView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color(.gray)
      SSSS_WordBoxContainerView(isAnimating: .constant(false))
        .frame(height: 400)
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
    GeometryReader { geometry in
      SSSS_WordBoxContainerView(isAnimating: $isAnimationActive)
        .offset(x: isAnimationActive ? UIScreen.main.bounds.width:
          -UIScreen.main.bounds.width
//        -geometry.size.width
      )
        .frame(maxWidth: .infinity)
        .animation(.linear(duration: SlidingWordConst.slidingAnimeDuration)
          .repeatForever(autoreverses: false)
        , value: isAnimationActive)
    }
  }

  private func centerLine(_ size: CGSize) -> some View {

    Rectangle()
      .fill(Color.white)
      .frame(width: 2, height: size.height)
  }
}
