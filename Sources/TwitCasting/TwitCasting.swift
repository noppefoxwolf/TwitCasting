//
//  Twitcasting.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation
import Combine

public enum TwitCasting {
    static let baseURL: URL = URL(string: "https://apiv2.twitcasting.tv")!
    
    public struct Client {
        let accessToken: String
        
        public init(accessToken: String) {
            self.accessToken = accessToken
        }
        
        func get<T: Codable>(path: String, params: [String : String] = [:]) -> AnyPublisher<T, Error> {
            let query = params.map({ "\($0.key)=\($0.value)" }).joined(separator: "&")
            var url = TwitCasting.baseURL.appendingPathComponent(path)
            if !query.isEmpty {
                url.appendPathComponent("?" + query)
            }
            print(url)
            var request = URLRequest(url: url)
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.setValue("2.0", forHTTPHeaderField: "X-Api-Version")
            let session = URLSession(configuration: .default)
            return session.dataTaskPublisher(for: request).tryMap { (data, response) -> T in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    return try decoder.decode(T.self, from: data)
                } catch let (error) {
                    if let twitCastingError = try? decoder.decode(TwitCastingError.self, from: data) {
                        throw twitCastingError
                    } else {
                        throw error
                    }
                }
            }.receive(on: DispatchQueue.main).eraseToAnyPublisher()
        }
    }
}
