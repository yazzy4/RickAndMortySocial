//
//  MainTabController.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import UIKit

class RMMainTabController: UITabBarController {
    
    // MARK: - Properties
    
    var character: Character? {
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? RMFeedController else { return }
            
            feed.character = character
        }
    }

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - API
    
    func fetchCharacters() {
        
        
        
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        let feed = RMFeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        nav1.tabBarItem.title = "Characters"
        
        let explore = RMEpisodeController()
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        nav2.tabBarItem.title = "Episodes"
        
        viewControllers = [nav1, nav2]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        nav.isNavigationBarHidden = false
        return nav
        
    }
}
