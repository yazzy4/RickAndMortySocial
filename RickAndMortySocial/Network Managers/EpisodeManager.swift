//
//  EpisodeManager.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import Foundation
import Alamofire


struct EpisodeManager {
    
    public static func getEpisode(url: String,
                                  onSuccess: @escaping (Episode) -> Void,
                                  onError: @escaping (String) -> Void) {
        
        AF.request(url, method: .get).validate()
            .responseDecodable(of: Episode.self) { response in
                guard let episode = response.value else {
                    onError("Error fetching the episode!")
                    return
                }
                onSuccess(episode)
        }
    }
}
