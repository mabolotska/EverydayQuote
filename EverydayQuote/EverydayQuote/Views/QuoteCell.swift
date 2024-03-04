//
//  QuoteCell.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 03/03/24.
//

import UIKit


class QuoteCell: UICollectionViewCell {
    static let reuseID = "QuoteCell"
    
    let categoryLabel = CategoryLabel(textAlignment: .center, fontSize: 16)


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(category: Quote) {
        categoryLabel.text = category.category
//        NetworkManager.shared.downloadImage(from: follower.avatarUrl) { [weak self] image in
//                    guard let self = self else { return }
//                    DispatchQueue.main.async { self.avatarImageView.image = image }
//                }
    }

    private func configure() {
        addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
        }
    }
}
