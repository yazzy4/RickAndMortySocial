//
//  RMProfileCell.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/13/22.
//

import Foundation
import UIKit

class RMEpisodeCell: UITableViewCell {
    
    // MARK: - Properties
    
    var episode: Episode? {
        didSet { configure() }
    }
    
    private lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Username"
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var episodeDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        label.text = "Full Name"
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.init(name: "SFProText-Semibold", size: 11.0)
    
        return label
    }()

    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(episodeLabel)
        episodeLabel.anchor(top: topAnchor, left: leftAnchor, paddingLeft: 8)
        
        addSubview(episodeDetailLabel)
        episodeDetailLabel.anchor(top: episodeLabel.bottomAnchor, left: leftAnchor, paddingLeft: 8)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let episode = episode else { return }
        
        episodeLabel.text = episode.name
        episodeDetailLabel.text = episode.airDate
    }
}
