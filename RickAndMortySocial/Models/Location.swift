//
//  Location.swift
//  RickAndMorty
//
//  Created by Yaz Burrell on 7/9/22.
//

import Foundation
import Alamofire

struct LocationList: Decodable {
    let info: LocationInfo
    let results: [Location]
    
struct LocationInfo: Decodable {
    var count: Int
    var pages: Int
    
    }
    
    
struct Location: Decodable {
    let name: String
    var type: String
    var dimension: String
    var residents: [Residents]
    let url: String
    
    }
    
struct Residents: Decodable {
    
    }
}


