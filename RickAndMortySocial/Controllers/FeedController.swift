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
    
    var character: Character? {
        didSet { configureLeftBarButton() }
    }
    
    private var characters = [Character]() {
         didSet { collectionView.reloadData() }
    }
    var currentUrl = ""
    var currentPage = 0
    private var charactersImage = [UIImage]()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchCharacters()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - API
    
    func fetchCharacters(){
        WebService.shared.getCharacters(name: character?.name, status: character?.status, species: character?.species, gender: character?.gender) { [weak self] (characters) in
            guard let self = self else {return}
            characters.forEach({
                WebService.shared.getImage(fromUrl: $0.image) { (image) in
                    guard let image = image else { return }
                    DispatchQueue.main.async {
                        
                        self.charactersImage.append(image)
                        self.collectionView.reloadData()
                    }
                }
            })
            DispatchQueue.main.async {
                self.characters = characters
            }
        }

}

    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        collectionView.register(RMCharacterCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let imageView = UIImageView(image: UIImage(named: "Twitter"))
        
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
        
        
    }
    
    func configureLeftBarButton() {
        guard let character = character else { return }
        
        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        
        profileImageView.sd_setImage(with: URL(string: character.image), completed: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}


// MARK: - UICollectionViewDelegate/Datasource

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.charactersImage.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RMCharacterCell
        let characters = characters[indexPath.row]
        
        cell.characterImageView.image = charactersImage[indexPath.row]
        cell.nameLabel.text = characters.name
        cell.speciesLabel.text = characters.species
        
        return cell 
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ProfileController(character: characters[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewModel = CharacterViewModel(character: characters[indexPath.row])
        let height = viewModel.size(forWidth: view.frame.width).height
        
        return CGSize(width: view.frame.width, height: height + 72)
    }
}

// MARK: - TweetCellDelegate

extension FeedController: CharacterCellDelegate {
    func handleProfileImageTapped(_ cell: RMCharacterCell) {
        guard let character = cell.character else { return }
        let controller = ProfileController(character: character)
        navigationController?.pushViewController(controller, animated: true)
    }
  
}



