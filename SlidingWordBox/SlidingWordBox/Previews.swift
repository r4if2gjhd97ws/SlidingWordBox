//
//  Previews.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/09.
//

import Foundation
import SwiftUI

struct SSSS_WordBox_Previews: PreviewProvider {

    @State static var isAnimating: Bool = false

    static var previews: some View {
        ZStack {
            Color(.gray)
            VStack {
                SSSS_WordBox("Friend", isAnimating: $isAnimating, fillingAfter: 0
                )
                Spacer()
                    .frame(height: 20)
                Button("Toggle") {
                    isAnimating = true
                }
            }
        }
    }
}

struct SSSS_SlidingRoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray)
//            SSSS_WordBoxAnimationView("サンプルテキスト"
//                                      , isAnimationActive: .constant(true)
//            )
        }
    }
}
