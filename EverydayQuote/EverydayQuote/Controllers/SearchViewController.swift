//
//  ViewController.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 03/03/24.
//

import UIKit
import SnapKit

enum Section {
    case main
}

class SearchViewController: UIViewController {
    var isSearching = false
    var collectionView: UICollectionView!
    var quotes: [Quote] = []
    var filteredQuotes: [Quote] = []
    var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategoryData()
        
        configureCollectionView()
        configureDataSource()
        configureViewController()
        configureSearchController()
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: String) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuoteCell.reuseID, for: indexPath) as? QuoteCell
            cell?.contentView.backgroundColor = .systemBlue // Set your own styling
            cell?.contentView.layer.cornerRadius = 8 // Set your own styling
            cell?.contentView.layer.masksToBounds = true // Set your own styling
            cell?.categoryLabel = identifier
            return cell
        }
 }
    
    func getCategoryData() {
        let categories = Categories().categories
          
        
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(QuoteCell.self, forCellWithReuseIdentifier: QuoteCell.reuseID)
    }
    
    

    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Daily Quote"
        navigationController?.navigationBar.prefersLargeTitles = true
        
      
    }
    
    func configureSearchController() {
          let searchController = UISearchController()
          searchController.searchResultsUpdater = self
  
          searchController.searchBar.placeholder = "Search for a quote"
          searchController.obscuresBackgroundDuringPresentation = false // removes light overlay on results below
          navigationItem.searchController = searchController

      }
    
 
}

extension SearchViewController: UICollectionViewDelegate {    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // clever way to aleternate on an array
        let activeArray = isSearching ? filteredQuotes : quotes
        let text = activeArray[indexPath.item]

        let destVC = QuoteViewController()
       
        destVC.quoteText = text.quote
//        destVC.delegate = self
         let navController = UINavigationController(rootViewController: destVC) // gives you the top bar
         present(navController, animated: true)
     
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // make sure have text
        guard let filter = searchController.searchBar.text, filter.isEmpty == false else {
            filteredQuotes.removeAll()
   //         updateData(on: quotes)
            isSearching = false
            return
        }
        
        isSearching = true
        // uses two arrays to control which array to show at a given moment
        filteredQuotes = quotes.filter { $0.quote.lowercased().contains(filter.lowercased()) }
   //     updateData(on: filteredQuotes)
    }
}
