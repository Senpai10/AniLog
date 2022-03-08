//
//  AnimeSearch.swift
//  AniLog
//
//  Created by USER on 18/01/2022.
//

import Foundation

// MARK: - AnimeSearch
struct Search: Codable {
    let requestHash: String
    let requestCached: Bool
    let requestCacheExpiry: Int
    let results: [AnimeSearch]
    let lastPage: Int

    enum CodingKeys: String, CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case results
        case lastPage = "last_page"
    }
}

// MARK: - Result
struct AnimeSearch: Codable {
    let malID: Int
    let url: String
    let imageURL: String
    let title: String
    let airing: Bool
    let synopsis: String
    let type: TypeEnum
    let episodes: Int
    let score: Double
    let startDate: String?
    let endDate: String?
    let members: Int
    let rated: String?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url
        case imageURL = "image_url"
        case title, airing, synopsis, type, episodes, score
        case startDate = "start_date"
        case endDate = "end_date"
        case members, rated
    }
}
