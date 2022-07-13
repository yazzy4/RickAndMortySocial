//
//  Location.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import Foundation
import Alamofire

struct LocationList: Codable {
    let info: LocationInfo
    let results: [Location]
    
struct LocationInfo: Codable {
    var count: Int
    var pages: Int
    
    }
    
    
struct Location: Codable {
    let name: String
    var type: String
    var dimension: String
    var residents: [Residents]
    let url: String
    
    }
    
struct Residents: Codable {
    
    }
}

