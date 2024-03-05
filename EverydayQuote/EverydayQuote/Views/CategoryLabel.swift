//
//  CategoryLabel.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 03/03/24.
//

import UIKit

final class CategoryLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(textAlignment: NSTextAlignment, fontSize: CGFloat, textColor: UIColor) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.textColor = textColor
        configure()
    }
    
    private func configure() {
       
        adjustsFontSizeToFitWidth = true // shrink a bit to try to fit into the label
        minimumScaleFactor = 0.9
   
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
