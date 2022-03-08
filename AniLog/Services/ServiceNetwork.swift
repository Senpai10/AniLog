//
//  ServiceNetwork.swift
//  AniLog
//
//  Created by USER on 23/12/2021.
//

import Foundation
import Apollo

class ServiceNetwork {
    static let shared = ServiceNetwork()
    fileprivate let apiPath = "https://graphql.anilist.co"

    private(set) lazy var apollo = ApolloClient(url: URL(string: apiPath)!)
}
