//
//  UIHelper.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 03/03/24.
//

import UIKit


enum UIHelper {
    
    static func createTwoColFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width =  view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: 30)
        
        return flowLayout
    }
}
