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

public extension TwitCasting.Client {
    func verifyCredentials() -> AnyPublisher<VerifyCredentials.Response, Error> {
        self.get(path: "/verify_credentials")
    }
    
    enum VerifyCredentials {
        public struct Response: Codable {
            ///    アクセストークンに紐づくアプリケーション情報 Appオブジェクト
            public let app: App
            ///    アクセストークンに紐づくユーザ情報 Userオブジェクト
            public let user: User
            ///    ユーザーのサポーターの数
            public let supporterCount: Int
            ///    ユーザーがサポートしている数
            public let supportingCount: Int
        }
    }
}
