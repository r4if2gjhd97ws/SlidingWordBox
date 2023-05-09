//
//  SlidingWordsView.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/09.
//

import Foundation
import SwiftUI

enum SlidingWordType: Int, CaseIterable {
    case may
    case eye
    case last
    case went
    case to
    case car
    case friend

    var text: String {
        switch self {
        case .friend: return "frɛnd"
        case .car: return "kɑr"
        case .to: return "tu"
        case .went: return "wɛnt"
        case .last: return "læst"
        case .eye: return "aɪ"
        case .may: return "meɪ"
        }
    }

    var yRatio: CGFloat {
        switch self {
        case .friend: return 2
        case .car: return 1
        case .to: return 4
        case .went: return 6
        case .last: return 8
        case .eye: return 9
        case .may: return 10
        }
    }
}
