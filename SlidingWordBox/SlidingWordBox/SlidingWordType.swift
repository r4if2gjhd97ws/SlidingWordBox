//
//  SlidingWordsView.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/09.
//

import Foundation
import SwiftUI

class APADeviceInfo: NSObject {


    static let defaultDesignIPhoneSize = iPhone8Size
    static let iPhone8Size = CGSize(width: 375, height: 667)
}

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

    var yValue: CGFloat {
        return yRatio / APADeviceInfo.defaultDesignIPhoneSize.height * UIScreen.main.bounds.height
    }

    var yRatio: CGFloat {
        switch self {
        case .friend: return 154
        case .car: return 33
        case .to: return 51
        case .went: return 67
        case .last: return 133
        case .eye: return 97
        case .may: return 162
        }
    }

    var fillingAfter: Int {
        switch self {
        case .friend: return 1
        case .car: return 2
        case .to: return 3
        case .went: return 4
        case .last: return 5
        case .eye: return 6
        case .may: return 7
        }
    }
}
