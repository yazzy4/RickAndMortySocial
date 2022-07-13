//
//  ExploreController.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import UIKit

private let reuseIdentifier = "characterCell"

class ExploreController: UITableViewController {
    
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - API
    
    func fetchCharacters() {
        
        
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
        
        tableView.register(RMCharacterCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }
    


}
