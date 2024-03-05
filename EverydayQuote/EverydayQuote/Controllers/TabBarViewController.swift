//
//  TabBarViewController.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 05/03/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = SearchViewController()
        let vc2 = JokesViewController()
        let vc3 = NorrisViewController()

        vc1.title = "Search Quote"
        vc2.title = "Jokes"
        vc3.title = "Chuck Norris"

        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always

        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)

        nav1.tabBarItem = UITabBarItem(title: "Quotes", image: UIImage(systemName: "bubble.left.and.bubble.right"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Jokes", image: UIImage(systemName: "smiley"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Chuck Norris", image: UIImage(systemName: "person.2.square.stack"), tag: 1)

        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true

        setViewControllers([nav1, nav2, nav3], animated: false)
    }


}

