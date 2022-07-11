//
//  Character.swift
//  RickAndMorty
//
//  Created by Yaz Burrell on 7/9/22.
//

import Foundation
import Alamofire


struct CharacterList: Decodable {
    let info: CharacterInfo
    let results: [Character]


struct CharacterInfo: Decodable {
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
