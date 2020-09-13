//
//  TwitCasting+Movie.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation
import Combine

public extension TwitCasting.Client {
    func getCurrentLive(userId: String) -> AnyPublisher<GetCurrentLive.Response, Error> {
        self.get(path: "/users/\(userId)/current_live")
    }
    
    enum GetCurrentLive {
        public struct Response: Codable {
            ///Movieオブジェクト
            let movie: Movie
            ///配信者のユーザ情報 Userオブジェクト
            let broadcaster: User
            ///設定されているタグの配列
            let tags: String
        }
    }
}
