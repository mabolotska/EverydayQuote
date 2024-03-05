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
    var categoriesArray = Categories().categories
    var filteredQuotes: [String] = []
    var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
         configureDataSource() 
        getCategoryData(on: categoriesArray)
         
         configureViewController()
         configureSearchController()
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: String) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuoteCell.reuseID, for: indexPath) as? QuoteCell
            cell?.categoryLabel.text = identifier
            return cell
        }
 }
    
    func getCategoryData(on categories: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(categories)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
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
  
          searchController.searchBar.placeholder = "Search for a category"
          searchController.obscuresBackgroundDuringPresentation = false // removes light overlay on results below
          navigationItem.searchController = searchController

      }
    
 
}

extension SearchViewController: UICollectionViewDelegate {    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // clever way to aleternate on an array
        let activeArray = isSearching ? filteredQuotes : categoriesArray
        let text = activeArray[indexPath.item]

        let destVC = QuoteViewController()
       
 //       destVC.quoteText = text.quote
//        destVC.delegate = self
         let navController = UINavigationController(rootViewController: destVC) // gives you the top bar
         present(navController, animated: true)
     
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // make sure have text
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            isSearching = false
            getCategoryData(on: categoriesArray)
           
            return
        }
        
        isSearching = true
        filteredQuotes = categoriesArray.filter { $0.lowercased().contains(filter.lowercased()) }
        getCategoryData(on: filteredQuotes)
    }
}
