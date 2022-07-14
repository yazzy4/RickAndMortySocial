//
//  RMProfileDetails.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/14/22.
//

import UIKit

class RMProfileDetailsView: UIView {
    
    // MARK: - Properties
    
    private var profileFilterView = RMProfileFilterView()
    
     lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isUserInteractionEnabled = true
        tableView.backgroundColor = .white
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubview(profileFilterView)
        profileFilterView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(tableView)
        tableView.anchor(top: profileFilterView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
   
    }
    
    
}
