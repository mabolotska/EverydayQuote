//
//  QuoteViewController.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 03/03/24.
//

import UIKit

class QuoteViewController: UIViewController {
    var quoteText: String!
    let quoteLabel = CategoryLabel(textAlignment: .center, fontSize: 25, textColor: .black)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getUserInfo()
    }
    
    func getUserInfo() {
  
        
        UIView.transition(with: quoteLabel, duration: 3, options: .transitionCrossDissolve, animations: {
   
            self.quoteLabel.text = self.quoteText
          }, completion: nil)
    }
}


extension QuoteViewController {
    func setupUI() {
        view.addSubview(quoteLabel)
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        quoteLabel.layer.borderWidth = 2
        quoteLabel.numberOfLines = 0
        quoteLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
