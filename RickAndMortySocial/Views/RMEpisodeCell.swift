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
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Username"
        return label
    }()
    
    private let episodeDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Full Name"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let stack = UIStackView(arrangedSubviews: [episodeLabel, episodeDetailLabel])
        stack.spacing = 2
        addSubview(stack)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let episode = episode else { return }
        
        episodeLabel.text = episode.name
        episodeDetailLabel.text = episode.created
    }
}
