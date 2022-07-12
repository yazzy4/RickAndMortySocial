//
//  RMCharacterCell.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import UIKit
import SDWebImage


class RMCharacterCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var character: CharacterList.Character? {
        didSet { configure() }
    }
    
    private lazy var characterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 40, height: 40)
        iv.layer.cornerRadius = 40 / 2
        
        return iv
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Test Caption"
        return label
    }()
    
    private let speciesLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(characterImageView)
        characterImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop:                         8, paddingBottom: 8)
        let stack = UIStackView(arrangedSubviews: [statusLabel, speciesLabel])
        stack.axis = .vertical
        stack.spacing = 2
        
        addSubview(stack)
        stack.centerY(inView: characterImageView, leftAnchor: characterImageView.rightAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let character = character else { return }
        
        characterImageView.sd_setImage(with: URL(string: character.image))
        
        statusLabel.text = character.status
        speciesLabel.text = character.species
    }
    
}
