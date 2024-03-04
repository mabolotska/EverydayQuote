//
//  QuoteViewController.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 03/03/24.
//

import UIKit

class QuoteViewController: UIViewController {
   // weak var delegate: FollowerListVCDelegate!
    var categoryName: String!
    var quoteText: String!
    let headerView = UIView()
    let quoteLabel = CategoryLabel(textAlignment: .center, fontSize: 25)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getUserInfo()
    }
    
    func getUserInfo() {
        
    }
}


extension QuoteViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
