//
//  UISS_WordBox.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/11.
//

import Foundation
import UIKit
//
//class UISS_WordBox: UIView {
//    let text: String
//    var isAnimating: Bool
//    let margin: CGFloat = 16
//    var pillWidth: CGFloat = 0 {
//        didSet {
//            wordBoxCircle.frame.size.width = pillWidth
//            setNeedsLayout()
//            layoutIfNeeded()
//        }
//    }
//
//    var wordBoxCircle: SSSS_WordBoxCircle!
//    var textLabel: UILabel!
//    var starLabel: UILabel!
//
//    init(_ text: String, isAnimating: Bool) {
//        self.text = text
//        self.isAnimating = isAnimating
//        super.init(frame: .zero)
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupViews() {
//        backgroundColor = .yellow
//
//        wordBoxCircle = 
//        
//        SSSS_WordBoxCircle(isAnimating: isAnimating, pillWidth: pillWidth)
//        addSubview(wordBoxCircle)
//
//        textLabel = UILabel()
//        textLabel.text = text
//        textLabel.backgroundColor = .cyan
//        textLabel.font = UIFont.systemFont(ofSize: 20)
//        addSubview(textLabel)
//
//        starLabel = UILabel()
//        starLabel.text = "☆"
//        addSubview(starLabel)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        // TODO: Adjust your frames as needed
//        wordBoxCircle.frame = CGRect(x: margin, y: margin, width: pillWidth, height: 27)
//        textLabel.frame = CGRect(x: margin, y: wordBoxCircle.frame.maxY + margin, width: pillWidth, height: 20)
//        starLabel.frame = CGRect(x: margin, y: textLabel.frame.maxY + margin, width: pillWidth, height: 20)
//    }
//}
