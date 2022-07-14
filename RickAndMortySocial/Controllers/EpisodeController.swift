//
//  ExploreController.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import UIKit

private let reuseIdentifier = "characterCell"

class EpisodeController: UITableViewController {

    
    //MARK: - Properties
    
    private var episodes = [Episode]() {
        didSet { tableView.reloadData() }
    }
    
    private var filteredEpisodes = [Episode]() {
        didSet { tableView.reloadData() }
    }
    
    private var inSearchMode: Bool {
        return searchController.isActive &&
        !searchController.searchBar.text!.isEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var seasons = [String]()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchEpisodes()
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - API
    
    func fetchEpisodes() {
        WebService.shared.getEpisodes(name: nil) { [weak self] (episodes) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.episodes = episodes
                let episodesSeason = self.episodes.map({ String($0.episode.dropLast(3)) })
                self.seasons = Array(Set(episodesSeason)).sorted()
            }
        }
        
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
        
        tableView.register(RMCharacterCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }
    
    func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search for user"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
    
}

// MARK: - UITableViewDelegate/DataSource
extension EpisodeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredEpisodes.count : episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! RMEpisodeCell
        let episode = inSearchMode ? filteredEpisodes[indexPath.row] : episodes[indexPath.row]
        cell.episode = episode
        
        return cell
    }
}
