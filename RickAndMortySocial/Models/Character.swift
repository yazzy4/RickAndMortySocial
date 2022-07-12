//
//  Character.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import Foundation
import Alamofire

// Add image handling
struct CharacterList: Decodable {
    let info: CharacterListInfo
    let results: Character


struct CharacterListInfo: Decodable {
    var count: Int
    var pages: Int
}


struct Character: Decodable {
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

struct Origin: Decodable {
    let name: String
}


}
