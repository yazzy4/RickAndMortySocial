//
//  CharacterViewModel.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/13/22.
//

import Foundation


class CharacterViewModel: ObservableObject {
    
    
    
//    enum State {
//        case initialState
//        case loading
//        case successLoadingCharacters(data: [CurrentCharacterViewModel])
//        case failed(error: Error)
//    }
//
//    struct CurrentCharacterViewModel: Identifiable {
//
//        var id = UUID()
//
//        let info: Info
//        let results: [Character]
//
//        var pageCount: Int {
//            info.pages
//        }
//        var characterCount: Int {
//            info.count
//        }
//        var nextURL: String? {
//            info.next // !
//        }
//        var previousURL: String? {
//            info.prev
//        }
//
//    }
//
//    // MARK: - Properties
//
//    var state: State = .initialState
//    var hasError: Bool = false
//    var currentCharacters = [CurrentCharacterViewModel]()
//
//    var rickAndMortyURL = "https://rickandmortyapi.com/api/character/?page=1&name="
//
//    private let webService: WebService  // dependency injection
//
//    init(webService: WebService) {
//        self.webService = webService
//    }
//
//
//
//    // MARK: - API
//
//    func fetchTotalCharacterCount(currentCharacters: [CurrentCharacterViewModel]) -> Int {
//        var count = 1
//
//        for currentCharacter in currentCharacters {
//            count = currentCharacter.characterCount
//        }
//
//        return count
//    }
//
//    func fetchTotalPageCount(currentCharacters: [CurrentCharacterViewModel]) -> Int {
//        var count = 1
//
//        for currentCharacter in currentCharacters {
//            count = currentCharacter.pageCount
//        }
//
//        return count
//    }
//
//    func fetchCharacters(url: String) async {
//        do {
//            let currentCharacter = try await
//            webService.fetchCharacters(url: url)
//
//            if let character = currentCharacter {
//                let currentCharacterViewModel = CurrentCharacterViewModel(id: UUID(), info: character.info , results: character.results)
//
//                self.currentCharacters.append(currentCharacterViewModel)
//            }
//
//        } catch {
//            self.state = .failed(error: error)
//            self.hasError = true
//        }
//    }
    
}
