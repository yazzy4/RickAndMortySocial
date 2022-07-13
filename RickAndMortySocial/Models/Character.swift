//
//  Character.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import Foundation
import Alamofire

// Add image handling
struct CharacterList: Codable {
    let info: CharacterListInfo
    var results: [Character]
}

struct CharacterListInfo: Codable {
    var count: Int
    var pages: Int
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: LocationList
    let image: String
    let created: String

}

struct Origin: Codable {
    let name: String
}
