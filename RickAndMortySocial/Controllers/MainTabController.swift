//
//  MainTabController.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
//    var character: CharacterList {
//        guard let nav = viewControllers?[0] as? UINavigationController else { return }
//    }
    
    func configureViewControllers() {
        
        let feed = CharacterFeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationController(image: UIImage(named: "NewsFeed"), rootViewController: feed)
        
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
