//
//  Location.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/13/22.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: URL
    let created: String
}

struct LocationList: Codable {
    let results: [Location]
    let info: Info
}
