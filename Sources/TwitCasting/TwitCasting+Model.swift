//
//  TwitCasting+Model.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation

public struct User: Codable, Identifiable, Equatable, Hashable {
    ///ユーザID
    public let id: String
    ///id同様にユーザを特定する識別子ですが、screen_idはユーザによって変更される場合があります。
    public let screenId: String
    ///ヒューマンリーダブルなユーザの名前
    public let name: String
    ///ユーザアイコンのURL
    public let image: String
    ///プロフィール文章
    public let profile: String
    ///ユーザのレベル
    public let level: Int
    ///ユーザが最後に配信したライブのID
    public let lastMovieId: String?
    ///現在ライブ配信中かどうか
    public let isLive: Bool
}

public struct Movie: Codable, Identifiable, Equatable, Hashable {
    ///    ライブID
    public let id: String
    ///ライブ配信者のユーザID
    public let userId: String
    ///タイトル
    public let title: String
    ///テロップ
    public let subtitle: String?
    ///ライブ配信者の最新コメントの文章
    public let lastOwnerComment: String?
    ///カテゴリID
    public let category: String?
    ///ライブ(録画)へのリンクURL
    public let link: String
    ///ライブ配信中かどうか
    public let isLive: Bool
    ///録画が公開されているかどうか
    public let isRecorded: Bool
    ///    総コメント数
    public let commentCount: Int
    ///   サムネイル画像(大)のURL
    public let largeThumbnail: String
    ///  サムネイル画像(小)のURL
    public let smallThumbnail: String
    ///  配信地域(国コード)
    public let country: String
    /// 配信時間(秒)
    public let duration: Int
    ///配信開始日時のunixタイムスタンプ
    public let created: Int
    ///   コラボ配信かどうか
    public let isCollabo: Bool
    ///   合言葉配信かどうか
    public let isProtected: Bool
    /// 最大同時視聴数(配信中の場合0)
    public let maxViewCount: Int
    ///現在の同時視聴者数(配信中ではない場合0)
    public let currentViewCount: Int
    ///総視聴者数
    public let totalViewCount: Int
    ///HTTP Live Streaming再生用のURL
    public let hlsUrl: String?
}

public struct Comment: Codable, Identifiable, Equatable, Hashable {
    ///コメントID
    public let id: String
    ///コメント本文
    public let message: String
    ///コメント投稿者の情報 Userオブジェクト
    public let fromUser: User
    ///コメント投稿日時のunixタイムスタンプ
    public let created: Int
}

public struct TwitCastingError: Error, Decodable {
    public let error: Error
    
    public struct Error: Decodable {
        public let code: Int
        public let message: String
    }
}

public struct App: Codable {
    ///   アプリケーションのクライアントID
    public let clientId: String
    ///   アプリケーション名
    public let name: String
    ///    アプリケーション開発者のユーザID
    public let ownerUserId: String
}
