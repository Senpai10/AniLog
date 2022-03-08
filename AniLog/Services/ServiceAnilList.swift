//
//  ServiceAnilList.swift
//  AniLog
//
//  Created by USER on 22/12/2021.
//

import Foundation
import Apollo

class ServiceAniList {
    
    static let shared = ServiceAniList()

    func getAnimeDetails(idMal: Int, completed: @escaping (Result<GraphQLResult<AnilistQuery.Data>, Error>) -> Void) {
        ServiceNetwork.shared.apollo.fetch(query: AnilistQuery(idMal: idMal)) { result in
            switch result {
            case .success(let graphQLResult):
                completed(.success(graphQLResult))
            case .failure(let error):
                print("Failure! Error: \(error)")
                completed(.failure(error))
            }
        }
    }
}
