//
//  UISS_WordBoxCircle.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/11.
//

import Foundation
import UIKit
import SwiftUI

struct UISS_WordBoxCircleRepresentable: UIViewRepresentable {
    @Binding var isAnimating: Bool
    @Binding var pillWidth: CGFloat
    var fillingAfter: CGFloat = 0

    func makeUIView(context: Context) -> UISS_WordBoxCircle {
        return UISS_WordBoxCircle()
    }
    func updateUIView(_ uiView: UISS_WordBoxCircle, context: Context) {
        uiView.setup(pillWidth: pillWidth)

        if isAnimating {
            uiView.animate(pillWidth, fillingAfter: fillingAfter)
        }
    }
    typealias UIViewType = UISS_WordBoxCircle
}

class UISS_WordBoxCircle: EECommonView {
    @IBOutlet weak var fillingView: UIView!
    @IBOutlet weak var fillingViewMargin: NSLayoutConstraint!

    var pillWidth: CGFloat = 0.0

    func setup(pillWidth: CGFloat) {

        if self.pillWidth == 0 {
            self.pillWidth = pillWidth
            self.fillingViewMargin.constant = pillWidth
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        EEDispatchUtility.executeOnce(.main, observer: self, key: "leyout") {
            self.clipsToBounds = true
            self.layer.cornerRadius = 14
            self.layer.borderColor = UIColor.red.cgColor
            self.layer.borderWidth = 1
        }
    }

    func animate(_ fillingViewWidth:CGFloat, fillingAfter: CGFloat) {
        self.fillingViewMargin.constant = 0
        UIView.animate(withDuration: 1, delay: fillingAfter, options: .curveLinear) {
            self.layoutIfNeeded()
        }
    }
}

