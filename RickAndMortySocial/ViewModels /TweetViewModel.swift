//
//  TweetViewModel.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 8/30/22.
//

import Foundation
import UIKit

struct TweetViewModel {
    
    let tweet: RMTweet
    let character: Character
    
    var profileImageUrl: URL? {
        return URL(string:character.image)
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now) ?? "2m"
    }
    
    var usernameText: String {
        return "@\(character.name)"
    }
    
    var headerTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a ∙ MM/dd/yyyy"
        return formatter.string(from: tweet.timestamp)
    }
    
    var retweetAttributedString: NSAttributedString? {
        return attributedText(withValue: tweet.retweetCount, text: "Retweets")
    }
    
    var likesAttributedString: NSAttributedString? {
        return attributedText(withValue: tweet.likes, text: "Likes")
    }
    
    
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: character.name,
                                              attributes:[.font: UIFont.boldSystemFont(ofSize: 14)])
        title.append(NSAttributedString(string: " @\(character.name.replacingOccurrences(of: " ", with: ""))",
                                        attributes:[.font: UIFont.boldSystemFont(ofSize: 14),                       .foregroundColor: UIColor.lightGray]))
        title.append(NSAttributedString(string: " ・ \(timestamp)",
                                        attributes:[.font: UIFont.boldSystemFont(ofSize: 14),                       .foregroundColor: UIColor.lightGray]))
    
        return title
    }
    
    init(tweet: RMTweet) {
        self.tweet = tweet
        self.character = tweet.user
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
        measurementLabel.text = tweet.caption
        measurementLabel.numberOfLines = 0
        measurementLabel.lineBreakMode = .byWordWrapping
        measurementLabel.translatesAutoresizingMaskIntoConstraints = false
        measurementLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        return measurementLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}

