//
//  EpisodeManager.swift
//  RickAndMortySocial
//
//  Created by Yaz Burrell on 7/11/22.
//

import Foundation
import Alamofire


struct EpisodeManager {
    
    enum ErrorType: Error {
        case genericFailure
        case failedToDecodeData
        case invalidStatusCode
    }
    
    static let shared = EpisodeManager()
    
    func fetchEpisodes(url: String) async throws -> Results? {
        
        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
        
        guard let networkRequestResponse = response as? HTTPURLResponse,
              networkRequestResponse.statusCode == 200 else {
            throw ErrorType.invalidStatusCode
        }
        
        let decodedData = try JSONDecoder().decode(Results.self, from: data)
        
        return (decodedData.self)
    }
    
    
    
//    func getAllEps(page: Int, completion: @escaping(Episodes) -> Void) {
//            guard let url = URL(string: "https://rickandmortyapi.com/api/episode?page=\(page)") else { return }
//
//            let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
//                if let error = error {
//                    print("Error fetching episodes: \(error.localizedDescription)")
//                }
//
//                guard let epsData = data else { return }
//                let decoder = JSONDecoder()
//
//                do {
//                    let decodedData = try decoder.decode(Episodes.self, from: epsData)
//                    completion(decodedData)
//                    //print(decodedData)
//                } catch {
//                    print("Error decoding data.")
//                }
//            }
//            dataTask.resume()
//    }
}
