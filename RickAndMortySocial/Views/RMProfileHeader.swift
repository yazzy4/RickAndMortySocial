//
//  RMProfileHeader.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/13/22.
//

import Foundation
import UIKit

protocol RMProfileHeaderDelegate: AnyObject {
    func handleDismissal()
    func handleEditProfileFollow(_ header: RMProfileHeader)
}
class RMProfileHeader: UICollectionReusableView {
    
//    // MARK: - Properties

    var character: Character? {
        didSet { configure() }
    }

    weak var delegate: RMProfileHeaderDelegate?

    private let filterBar = RMProfileFilterView()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue

        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 42, paddingLeft: 16)
        backButton.setDimensions(width: 30, height: 30)

        return view
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "baseline_arrow_back_white_24dp")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4
        return iv
    }()

     lazy var editProfileFollowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Loading", for: .normal)
        button.layer.borderColor = UIColor.twitterBlue.cgColor
        button.layer.borderWidth = 1.25
        button.setTitleColor(.twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleEditProfileFollow), for: .touchUpInside)
        return button
    }()

    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()

    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.text = "This is is where the user bio will go with the option of more than one line"
        return label
    }()

    private let underlineView: UIView = {
       let view = UIView()
        view.backgroundColor = .twitterBlue
        return view
    }()

    private let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "0 Following"
        label.isUserInteractionEnabled = true
        
        return label
    }()

    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "2 Followers"
        label.isUserInteractionEnabled = true

        return label
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        filterBar.delegate = self

        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 100)

        addSubview(profileImageView)
        profileImageView.anchor(top: containerView.bottomAnchor, left: leftAnchor,
                                paddingTop: -24, paddingLeft: 8)

        profileImageView.setDimensions(width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2

        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: containerView.bottomAnchor,
                                       right: rightAnchor, paddingTop: 12, paddingRight: 12)

        editProfileFollowButton.setDimensions(width: 100, height: 36)
        editProfileFollowButton.layer.cornerRadius = 36 / 2

        let userDetailsStack = UIStackView(arrangedSubviews: [fullnameLabel,
                                                              usernameLabel,
                                                              bioLabel])
        userDetailsStack.axis = .vertical
        userDetailsStack.distribution = .fillProportionally
        userDetailsStack.spacing = 4

        addSubview(userDetailsStack)
        userDetailsStack.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,
                                right: rightAnchor, paddingTop: 8, paddingLeft: 12,
                                paddingRight: 12)

        let followStack = UIStackView(arrangedSubviews: [typeLabel, genderLabel])
        followStack.axis = .horizontal
        followStack.spacing = 8
        followStack.distribution = .fillEqually

        addSubview(followStack)
        followStack.anchor(top: userDetailsStack.bottomAnchor, left: leftAnchor,
                           paddingTop: 8, paddingLeft: 12)

        addSubview(filterBar)
        filterBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)

        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.width / 3, height: 2)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors

    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }

    @objc func handleEditProfileFollow() {
        delegate?.handleEditProfileFollow(self)
    }


    // MARK: - Helpers

    func configure() {
        guard let character = character else { return }

        let viewModel = CharacterViewModel(character: character)

        profileImageView.sd_setImage(with: URL(string: character.image))

        editProfileFollowButton.setTitle(viewModel.character.status, for: .normal)
        typeLabel.attributedText = viewModel.likesAttributedString
        genderLabel.attributedText = viewModel.retweetAttributedString

        fullnameLabel.text = character.name
        usernameLabel.text = viewModel.fakeUsername
    }

}


// MARK: - ProfileFilterViewDelegate

extension RMProfileHeader: RMProfileFilterViewDelegate {
    func filterView(_ view: RMProfileFilterView, didSelect indexPath: IndexPath) {
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? RMProfileFilterCell else { return }

        let xPosition = cell.frame.origin.x
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = xPosition
        }
    }
}
