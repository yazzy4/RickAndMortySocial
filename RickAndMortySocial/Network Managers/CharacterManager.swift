//
//  CharacterManager.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import Foundation


class CharacterManager: Decodable {
    
    enum ErrorType: Error {
        case genericFailure
        case failedToDecodeData
        case invalidStatusCode
    }
    
    static let shared = CharacterManager()
    
    func fetchCharacters(url: String) async throws -> CharacterList? {
        
        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
        
        guard let networkRequestResponse = response as? HTTPURLResponse, networkRequestResponse.statusCode == 200 else {
            throw ErrorType.invalidStatusCode
        }
        
        let decodedData = try JSONDecoder().decode(CharacterList.self, from: data)
        return (decodedData.self)
    }
 
//    func getCharacter(url: String, completion: @escaping(Character) -> Void) {
//            guard let url = URL(string: url) else { return }
//
//            let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
//                if let error = error {
//                    print("Error fetching characters: \(error.localizedDescription)")
//                }
//
//                guard let charData = data else { return }
//                let decoder = JSONDecoder()
//
//                do {
//                    let decodedData = try decoder.decode(Character.self, from: charData)
//                    completion(decodedData)
//                    //print(decodedData)
//                } catch {
//                    print("Error decoding data.")
//                }
//            }
//            dataTask.resume()
//    }
//
//    func getAllCharacters(page: Int, completion: @escaping(CharacterList) -> Void) {
//        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else { return }
//
//        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
//            if let error = error {
//                print("Error fetching episodes: \(error.localizedDescription)")
//            }
//
//            guard let charData = data else { return }
//            let decoder = JSONDecoder()
//
//            do {
//                let decodedData = try decoder.decode(CharacterList.self, from: charData)
//                completion(decodedData)
//                //print(decodedData)
//            } catch {
//                print("Error decoding data.")
//            }
//        }
//        dataTask.resume()
//    }

}

