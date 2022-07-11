//
//  CharacterManager.swift
//  RickAndMorty
//
//  Created by Yaz Burrell on 7/10/22.
//

import Foundation
import Alamofire
import RickMortySwiftApi


class CharacterManager {
    
    public static func getCharactersByURL(page: String, name: String,
                      status: String, onSuccess:
                      @escaping(CharacterList) -> Void,
                      onError: @escaping(String) -> Void) {
        
        let url = "https://rickandmortyapi.com/api/character"
        
        var parameters = [String : String]()
        
        // https://rickandmortyapi.com/api/character/?page=19
        parameters["page"] = page
        
        if !name.isEmpty {
            parameters["name"] = name
        }
        
        if !status.isEmpty {
            parameters["status"] = status
        }
        
        AF.request(url, method: .get, parameters: parameters).validate().responseDecodable(of: CharacterList.self) { response in
            
            guard let characterCall = response.value else {
                onError("Error fetching characters page numbers on page: \(page)")
                return
            }
            onSuccess(characterCall)
        }
      
    }
    
    public static func getCharacterByID(id: Int, onSuccess: @escaping(CharacterList.Character) -> Void, onError: @escaping(String) -> Void ) {
        
        let url = "https://rickandmortyapi.com/api/character/\(id)"
        
        AF.request(url, method: .get).validate().responseDecodable(of: CharacterList.Character.self) { response in
            
            guard let characterCall = response.value else {
                onError("Error fetching charter by id #\(id)")
                return
            }
            onSuccess(characterCall)
        }
    }

}
