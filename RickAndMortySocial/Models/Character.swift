//
//  Character.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import Foundation


struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct CharacterLocation: Codable {
    let name: String
    let url: String
}

struct CharacterList: Codable {
    let results: [Character]
    let info: Info
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}





//struct CharacterList: Decodable {
//    let info: CharacterListInfo
//    var results: [Character]
//}
//
//struct CharacterListInfo: Decodable {
//    var count: Int
//    var pages: Int
//    let next: String?
//    let prev: String?
//}
//
//struct Character: Decodable, Identifiable, Equatable, Hashable {
//    var id = UUID()
//    let name: String
//    let status: String
//    let species: String
//    let gender: String
//    let origin: Location
//    let location: Location
//    let image: String
//    let created: String
//    let episode: [String]
//    let url: String
//
//}
//
//struct CurrentCharacterViewModel: Identifiable {
//    var id = UUID()
//
//    let info: CharacterListInfo
//    let results: [Character]
//
//    var pageCount: Int {
//        info.pages
//    }
//
//    var characterCount: Int {
//        info.count
//    }
//
//    var nextURL: String? {
//        info.next
//    }
//
//    var previousURL: String? {
//        info.prev
//    }
//
//}
//
//
//
//struct Origin: Codable {
//    let name: String
//}
//
//struct Location: Decodable, Equatable, Hashable {
//    let name: String
//    let url: String
//}
