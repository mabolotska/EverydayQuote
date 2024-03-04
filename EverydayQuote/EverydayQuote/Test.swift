//
//  Test.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 04/03/24.
//

import UIKit

import UIKit
import SnapKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let categories = [
        "age", "alone", "amazing", "anger", "architecture", "art", "attitude",
        "beauty", "best", "birthday", "business", "car", "change", "communication",
        "computers", "cool", "courage", "dad", "dating", "death", "design", "dreams",
        "education", "environmental", "equality", "experience", "failure", "faith",
        "family", "famous", "fear", "fitness", "food", "forgiveness", "freedom",
        "friendship", "funny", "future", "god", "good", "government", "graduation",
        "great", "happiness", "health", "history", "home", "hope", "humor",
        "imagination", "inspirational", "intelligence", "jealousy", "knowledge",
        "leadership", "learning", "legal", "life", "love", "marriage", "medical",
        "men", "mom", "money", "morning", "movies", "success"
    ]

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row].addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category=\(category)")!
        var request = URLRequest(url: url)
        request.setValue(Constants.apiKey, forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let quote = String(data: data, encoding: .utf8) {
                print(quote)
                // Do something with the quote, like displaying it in an alert
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Quote", message: quote, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        task.resume()
    }
}
