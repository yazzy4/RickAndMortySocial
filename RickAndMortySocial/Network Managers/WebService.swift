//
//  CharacterManager.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import Foundation
import Alamofire
import UIKit


class WebService: Decodable {
//
//    enum ErrorType: Error {
//        case genericFailure
//        case failedToDecodeData
//        case invalidStatusCode
//    }
//
//    static let shared = WebService()
//
//    func fetchCharacters(url: String) async throws -> CharacterList? {
//
//        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
//
//        guard let networkRequestResponse = response as? HTTPURLResponse, networkRequestResponse.statusCode == 200 else {
//            throw ErrorType.invalidStatusCode
//        }
//
//        let decodedData = try JSONDecoder().decode(CharacterList.self, from: data)
//        return (decodedData.self)
//    }
//
//    func fetchEpisodes(url: String) async throws -> Episode? {
//
//        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
//
//        guard let networkRequestResponse = response as? HTTPURLResponse,
//              networkRequestResponse.statusCode == 200 else {
//            throw ErrorType.invalidStatusCode
//        }
//
//        let decodedData = try JSONDecoder().decode(Episode.self, from: data)
//
//        return (decodedData.self)
//    }

    
    // old way
    static let shared = WebService()
      
      private init() {
          
      }

      func getCharacters(name: String?, status: String?, species: String?, gender: String?, completion: @escaping ([Character]) -> Void) {
          let host = "https://rickandmortyapi.com/api"
          let path = "/character"
          
          let params: Parameters = [
              "name": name ?? "",
              "status": status ?? "",
              "species": species ?? "",
              "gender": gender ?? "",
                  ]
          
          AF.request(host + path, parameters: params).responseData { (response) in
              switch response.result {
              case .success:
                  guard let data = response.value,
                        let characters = try? JSONDecoder().decode(CharacterList.self, from: data).results
                  else { return }
                  completion(characters)
              case .failure(let error):
                  print(error.localizedDescription)
                  print(error)
              }
          }
      }
      
      func getCharacter(url: String, completion: @escaping (Character) -> Void) {
          
          AF.request(url).responseData { (response) in
              switch response.result {
              case .success:
                  guard let data = response.value,
                        let character = try? JSONDecoder().decode(Character.self, from: data)
                  else { return }
                  completion(character)
              case .failure(let error):
                  print(error.localizedDescription)
              }
          }
      }
      
      public func getImage(fromUrl url: URLConvertible, completion: @escaping (UIImage?) -> Void) {
          AF.request(url).responseData { (response) in
              switch response.result {
              case .success:
                  guard let imageData = response.value,
                        let image = UIImage(data: imageData, scale: 1.0)
                  else { return }
                  completion(image)
              case .failure(let error):
                  print(error.localizedDescription)
              }
          }
      }
      
      func getEpisode(url: String, completion: @escaping (Episode) -> Void) {
          
          AF.request(url).responseData { (response) in
              switch response.result {
              case .success:
                  guard let data = response.value,
                        let episode = try? JSONDecoder().decode(Episode.self, from: data)
                  else { return }
                  completion(episode)
              case .failure(let error):
                  print(error.localizedDescription)
              }
          }
      }
      
      func getLocations(name: String?, type: String?, dimension: String?, completion: @escaping ([Location]) -> Void) {
          let host = "https://rickandmortyapi.com/api"
          let path = "/location"
          
          let params: Parameters = [
              "name": name ?? "",
              "type": type ?? "",
              "dimension": dimension ?? ""
                  ]
          
          AF.request(host + path, parameters: params).responseData { (response) in
              switch response.result {
              case .success:
                  guard let data = response.value,
                        let locations = try? JSONDecoder().decode(LocationrList.self, from: data).results
                  else { return }
                  completion(locations)
              case .failure(let error):
                  print(error.localizedDescription)
                  print(error)
              }
          }
      }
      
      func getEpisodes(name: String?, completion: @escaping ([Episode]) -> Void) {
          let host = "https://rickandmortyapi.com/api"
          let path = "/episode"
          
          let params: Parameters = [
              "name": name ?? ""
                  ]
          
          AF.request(host + path, parameters: params).responseData { (response) in
              switch response.result {
              case .success:
                  guard let data = response.value,
                        let episodes = try? JSONDecoder().decode(EpisodeList.self, from: data).results
                  else { return }
                  completion(episodes)
              case .failure(let error):
                  print(error.localizedDescription)
                  print(error)
              }
          }
      }
      
      func getLocation(url: String, completion: @escaping (Location) -> Void) {
          
          AF.request(url).responseData { (response) in
              switch response.result {
              case .success:
                  guard let data = response.value,
                        let location = try? JSONDecoder().decode(Location.self, from: data)
                  else { return }
                  completion(location)
              case .failure(let error):
                  print(error.localizedDescription)
              }
          }
      }
}


