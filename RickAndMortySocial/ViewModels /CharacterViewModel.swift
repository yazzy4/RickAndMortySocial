//
//  CharacterViewModel.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/13/22.
//

import Foundation
import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case episodes
    case locations
    
    var description: String {
        switch self {
        case .episodes: return "Episodes"
        case .locations: return "Location"
        }
    }
}


class CharacterViewModel: ObservableObject {
        
        let character: Character
        
        var profileImageUrl: URL? {
            return URL(string: character.image)
        }
        
        var fakeUsername: String {
            return "@\(character.name.replacingOccurrences(of: " ", with: ""))"
        }
        
        var retweetAttributedString: NSAttributedString? {
            return attributedText(withValue: character.episode.count, text: ": Episodes")
        }
        
        var likesAttributedString: NSAttributedString? {
            return attributedText(withValue: character.id, text: " : ID")
        }
        
        var userInfoText: NSAttributedString {
            let title = NSMutableAttributedString(string: character.type,
                                                  attributes:[.font: UIFont.boldSystemFont(ofSize: 14)])
            title.append(NSAttributedString(string: " @\(character.name)",
                                            attributes:[.font: UIFont.boldSystemFont(ofSize: 14),                       .foregroundColor: UIColor.lightGray]))
        
            return title
        }
        
        init(character: Character) {
            self.character = character
            
        }
        
        fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
              let attributedTitle = NSMutableAttributedString(string: " \(value)",
                                                      attributes: [.font :
                                                                  UIFont.boldSystemFont(ofSize: 14)])
              attributedTitle.append(NSAttributedString(string: " \(text)",
                                                        attributes: [.font :
                                                                  UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
              return attributedTitle
          }
        
        func size(forWidth width: CGFloat) -> CGSize {
            let measurementLabel = UILabel()
            measurementLabel.text = character.status
            measurementLabel.numberOfLines = 0
            measurementLabel.lineBreakMode = .byWordWrapping
            measurementLabel.translatesAutoresizingMaskIntoConstraints = false
            measurementLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
            return measurementLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        }
    }
    

