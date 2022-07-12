//
//  CharacterFeedController.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import UIKit

private let reuseIdentifier = "CharacterCell"

class FeedController: UICollectionViewController {
    
    // MARK: - Properties
    
    var characters: CharacterList.Character? {
        didSet { configureLeftBarButton() }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - API
    
    func fetchCharacters() {
        guard let characters = characters else {
            return
        }

//        CharacterManager.getCharactersByURL(page: characters?.info.pages, name: characters?.results.name, status: characters?.results.status) { characters in
//            <#code#>
//        } onError: { <#String#> in
//            <#code#>
//        }

    }
    
    
    // MARK: - Helpers
    
    func configure() {
        view.backgroundColor = .red
        
        collectionView.register(RMCharacterCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let imageView = UIImageView(image: UIImage(named: "Twitter"))
        
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
        
        
    }
    
    func configureLeftBarButton() {
        guard let character = characters else { return }
        
        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        
        profileImageView.sd_setImage(with: URL(string: character.image), completed: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }


}

extension FeedController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        cell.largeContentTitle = "Test"
    
        return cell 
    }
}


