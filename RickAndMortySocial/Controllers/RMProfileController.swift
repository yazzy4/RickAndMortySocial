//
//  ProfileController .swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/13/22.
//

import UIKit

private let reuseIdentifier = "RMEpisodeCell"
private let headerIdentifier = "CharacterHeader"

class RMProfileController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let character: Character

    
    private var characters = [Character]() {
        didSet { collectionView.reloadData() }
    }

    
    // MARK: - Lifecycle
    
    init(character: Character) {
        self.character = character
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchEpisodes()
    }
    
    // MARK: - API
    
    func fetchEpisodes() {
        
       
    }
    
    func fetchLocations() {
        
    }
    
    // MARK: - Helpers
    
    func configureCollectionView() {
        collectionView.backgroundColor = .white
        
        collectionView.register(RMCharacterCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(RMProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.contentInsetAdjustmentBehavior = .never
    }
 
}

// MARK: - UICollectionViewDataSource

extension RMProfileController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RMCharacterCell
        cell.character = characters[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension RMProfileController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! RMProfileHeader
        header.character = character
        
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RMProfileController:  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}
