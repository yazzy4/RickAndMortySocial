//
//  RMProfileDetailsController.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/14/22.
//

import UIKit

class RMProfileDetailsController: UIViewController {
    
    // MARK: - Properties
    
    private var profileDetailsView: RMProfileDetailsView {
        return self.view as! RMProfileDetailsView
    }
    
    private var character: Character
    private var location: Location?
    private var episodes = [Episode]()
    
    // MARK: - Lifecycle
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = RMProfileDetailsView()
    }
    
    
    
     
}
