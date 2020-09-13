//
//  Twitcasting+Auth.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation
import AuthenticationServices

public extension TwitCasting {
    class WebAuthenticationSession {
        let session: ASWebAuthenticationSession
        
        public init(
            clientID: String,
            callbackURLScheme: String,
            state: String = "x",
            completionHandler: @escaping ((Result<[String : String], Error>) -> Void)
        ) {
            let params: String = [
                "client_id" : clientID,
                "response_type" : "token",
                "state" : state
            ].map({ "\($0.key)=\($0.value)" }).joined(separator: "&")
            let url = TwitCasting.baseURL.appendingPathComponent("/oauth2/authorize?\(params)")
            session = ASWebAuthenticationSession(url: url, callbackURLScheme: callbackURLScheme, completionHandler: { (url, error) in
                switch Result(url, error) {
                case let .success(url):
                    let responseBody = url.absoluteString
                        .split(separator: "#")
                        .last?
                        .split(separator: "&")
                        .reduce(into: [String : String](), {
                            let q = $1.split(separator: "=")
                            $0[String(q[0])] = String(q[1])
                        }) ?? [:]
                    completionHandler(.success(responseBody))
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
        }
        
        public var presentationContextProvider: ASWebAuthenticationPresentationContextProviding? {
            get { session.presentationContextProvider }
            set { session.presentationContextProvider = newValue }
        }
        
        public func start() {
            session.start()
        }
    }
}
