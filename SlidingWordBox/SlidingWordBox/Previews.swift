//
//  Previews.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/09.
//

import Foundation
import SwiftUI

struct SSSS_WordBox_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray)
            SSSS_WordBox("Friend")
        }
    }
}

struct SSSS_SlidingRoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray)
            SSSS_WordBoxAnimationView("サンプルテキスト", isAnimationActive: .constant(true))
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
