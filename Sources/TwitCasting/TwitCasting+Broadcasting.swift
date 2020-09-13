//
//  TwitCasting+Broadcasting.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation
import Combine

public extension TwitCasting.Client {
    func getRTMPURL() -> AnyPublisher<GetRTMP.Response, Error> {
        self.get(path: "/rtmp_url")
    }
    
    enum GetRTMP {
        public struct Response: Codable {
            ///RTMP配信が有効かどうか
            let enabled: Bool
            ///RTMP配信用URL
            let url: String?
            ///RTMP配信用キー
            let streamKey: String?
        }
    }
}
