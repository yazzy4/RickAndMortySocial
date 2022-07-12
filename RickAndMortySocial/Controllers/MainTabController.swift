//
//  MainTabController.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    var character: CharacterList? {
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? FeedController else { return }
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        
        let feed = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        //let exploreFeed =
        
        viewControllers = [nav1]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        nav.isNavigationBarHidden = false
        return nav
        
    }
}
