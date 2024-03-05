//
//  JokesViewController.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 05/03/24.
//

import UIKit

class JokesViewController: UIViewController {
    let cellIdentifier = "cell"
    var jokes: [Jokes] = []
    
    private lazy var tableView: UITableView = {
          let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
          return tableView
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchJokes()
        setupUI()
    }
    
    func fetchJokes() {
        NetworkManager.shared.fetchData(apiKey: Constants.apiKey, url: Constants.jokesURl) { [weak self] (result: Result<[Jokes], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let jokes):
                DispatchQueue.main.async {
                    self.jokes = jokes
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching jokes: \(error)")
            }
        }
    }
}


extension JokesViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
}


extension JokesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let joke = jokes[indexPath.row]
        cell.textLabel?.text = joke.joke
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
