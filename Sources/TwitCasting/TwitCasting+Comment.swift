//
//  Twitcasting+Comment.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation
import Combine

public extension TwitCasting.Client {
    //    offset    先頭からの位置    min:0    no (default:0)
    //    limit    取得件数(場合により、指定件数に満たない数のコメントを返す可能性があります)    min:1, max:50    no (default:10)
    //    slice_id    このコメントID以降のコメントを取得します。このパラメータを指定した場合はoffsetは無視されます。
    enum PagingOption {
        case offset(Int)
        case sliceID(String)
    }
    
    func getComments(movieID: String, limit: Int = 10, option: PagingOption = .offset(0)) -> AnyPublisher<GetComments.Response, Error> {
        var params: [String : String] = [:]
        params["limit"] = "\(limit)"
        switch option {
        case let .offset(offset):
            params["offset"] = "\(offset)"
        case let .sliceID(id):
            params["slice_id"] = id
        }
        return self.get(path: "/movies/\(movieID)/comments")
    }
    
    enum GetComments {
        public struct Response: Codable {
            /// ライブID
            let movieId: String
            ///   総コメント数
            let allCount: Int
            ///    Commentオブジェクトの配列
            let comments: [Comment]
        }
    }
}
