//
//  RMProfileDetailsController.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/14/22.
//

import UIKit

private let reuseIdentifier = "EpisodeCell"

class RMProfileDetailsController: UIViewController {
    
    // MARK: - Properties
    
     private var profileDetailsView: RMProfileDetailsView {
        return self.view as! RMProfileDetailsView
    }
    
    var options: ProfileFilterOptions?
    
    weak var delegate: RMProfileFilterViewDelegate?
    
    
    private var character: Character
    private var locations = [Location]()
    private var episodes = [Episode]()
    
    // MARK: - Lifecycle
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = RMProfileDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileDetailsView.tableView.register(RMEpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)

        profileDetailsView.tableView.dataSource = self
        
        
        getCharacterEpisodes()
        
    }
    
    // MARK: - API
    
    private func getCharacterEpisodes() {
        self.character.episode.forEach({ WebService.shared.getEpisode(url: $0) { [weak self] (episode) in
            guard let self = self else { return }
            self.episodes.append(episode)
            self.profileDetailsView.tableView.reloadData()
        }})
    }   
     
}

extension RMProfileDetailsController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileFilterOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return episodes.count
        case 1:
            return locations.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ProfileFilterOptions.allCases.count {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? RMEpisodeCell {
                switch indexPath.row {
                case 0:
                    cell.episodeLabel.text = episodes[indexPath.row].episode
                    cell.episodeDetailLabel.text = episodes[indexPath.row].name
                    cell.dateLabel.text = episodes[indexPath.row].airDate
                    
                    return cell
                default:
                    return UITableViewCell()
                }
                
            }
            
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }

}

extension RMProfileDetailsController: RMProfileFilterViewDelegate {
    func filterView(_ view: RMProfileFilterView, didSelect indexPath: IndexPath) {
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? RMProfileFilterCell else  { return }
        var tv = UITableView()
         
        
        switch ProfileFilterOptions.allCases.count {
        case 0:
            if let cell = tv.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? RMEpisodeCell {
                switch indexPath.row {
                case 0:
                    cell.episodeLabel.text = episodes[indexPath.row].name
                    cell.episodeDetailLabel.text = episodes[indexPath.row].airDate
                    
                default:
                  break
                }
            }
        default:
             break
        }
    }
    
    
}
