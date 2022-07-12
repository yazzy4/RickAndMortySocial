//
//  LocationManager.swift
//  RickAndMorty
//
//  Created by Yaz Burrell on 7/10/22.
//

import Foundation
import Alamofire

struct LocationManager {
    
    public static func getLocation(url: String,
                                   onSuccess: @escaping (LocationList.Location) -> Void,
                                  onError: @escaping (String) -> Void) {
        
        AF.request(url, method: .get).validate()
            .responseDecodable(of: LocationList.Location.self) { response in
                guard let episode = response.value else {
                    onError("Error fetching the episode!")
                    return
                }
                onSuccess(episode)
        }
    }
    
    public static func getAllLocations() {
        
    }

}
