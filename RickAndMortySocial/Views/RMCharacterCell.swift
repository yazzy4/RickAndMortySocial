//
//  RMCharacterCell.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import UIKit


class RMCharacterCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var characterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        
    }()
    
}
