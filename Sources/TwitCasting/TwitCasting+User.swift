//
//  Twitcasting+User.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation
import Combine

public extension TwitCasting.Client {
    func getUserInfo(userId: String) -> AnyPublisher<GetUserInfo.Response, Error> {
        self.get(path: "/users/\(userId)")
    }
    
    enum GetUserInfo {
        public typealias Response = User
    }
}
