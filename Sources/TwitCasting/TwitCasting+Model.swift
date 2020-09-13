//
//  TwitCasting+Model.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation

public struct User: Codable {
    ///ユーザID
    let id: String
    ///id同様にユーザを特定する識別子ですが、screen_idはユーザによって変更される場合があります。
    let screenId: String
    ///ヒューマンリーダブルなユーザの名前
    let name: String
    ///ユーザアイコンのURL
    let image: String
    ///プロフィール文章
    let profile: String
    ///ユーザのレベル
    let level: Int
    ///ユーザが最後に配信したライブのID
    let lastMovieId: String?
    ///現在ライブ配信中かどうか
    let isLive: Bool
}

public struct Movie: Codable {
    ///    ライブID
    let id: String
    ///ライブ配信者のユーザID
    let userId: String
    ///タイトル
    let title: String
    ///テロップ
    let subtitle: String?
    ///ライブ配信者の最新コメントの文章
    let lastOwnerComment: String?
    ///カテゴリID
    let category: String?
    ///ライブ(録画)へのリンクURL
    let link: String
    ///ライブ配信中かどうか
    let isLive: Bool
    ///録画が公開されているかどうか
    let isRecorded: Bool
    ///    総コメント数
    let commentCount: Int
    ///   サムネイル画像(大)のURL
    let largeThumbnail: String
    ///  サムネイル画像(小)のURL
    let smallThumbnail: String
    ///  配信地域(国コード)
    let country: String
    /// 配信時間(秒)
    let duration: Int
    ///配信開始日時のunixタイムスタンプ
    let created: Int
    ///   コラボ配信かどうか
    let isCollabo: Bool
    ///   合言葉配信かどうか
    let isProtected: Bool
    /// 最大同時視聴数(配信中の場合0)
    let maxViewCount: Int
    ///現在の同時視聴者数(配信中ではない場合0)
    let currentViewCount: Int
    ///総視聴者数
    let totalViewCount: Int
    ///HTTP Live Streaming再生用のURL
    let hlsUrl: String?
}

struct Comment: Codable {
    ///コメントID
    let id: String
    ///コメント本文
    let message: String
    ///コメント投稿者の情報 Userオブジェクト
    let fromUser: User
    ///コメント投稿日時のunixタイムスタンプ
    let created: Int
}
