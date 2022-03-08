//
//  ServiceJikan.swift
//  AniLog
//
//  Created by USER on 16/12/2021.
//

import Foundation
import Alamofire

class SearchOptions {
    let rating = ["G - All Ages" : "g", "PG - Children" : "pg", "PG-13 - Teens 13 or older" : "pg13",
                  "R - 17+ (violence & profanity)" : "r17", "R+ - Mild Nudity" : "r", "Rx - Hentai" : "rx"]
    var type = ""
    var status = ""
    var ratingSelected = ""
    var minScore = "0"
    var maxScore = "10"
}

class ServiceJikan {
    static let shared = ServiceJikan()
    
    static let searchOptions = SearchOptions()
    
    fileprivate let apiPath = "https://api.jikan.moe/v4"
    fileprivate let animeScheduleEndpoint = "/schedules?filter="
    fileprivate let animeSeasonEndpoint = "/seasons/now"
    fileprivate let animeTopEndpoint = "/top/anime"
    fileprivate let animeUpcomingEndpoint = "/seasons/upcoming"
    fileprivate let searchLastestAnimeEndpoint = "/anime?q=&order_by=popularity&sort=desc&page=1"
    
    func getAnimeSchedule(day: String = "", completed: @escaping (Result<Anime, Error>) -> Void) {
        AF.request(apiPath + animeScheduleEndpoint + day, method: .get).response { responseData in
            // 429 - Too Many Request -> Retry with a delay
            if responseData.response?.statusCode == 429 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.getAnimeSchedule(day: day) { result in
                        switch result {
                        case .success(let animes):
                            completed(.success(animes))
                        case .failure(let error):
                            completed(.failure(error))
                        }
                    }
                }
            } else {
                do {
                    let animesToday = try JSONDecoder().decode(Anime.self, from: responseData.data ?? Data())
                    completed(.success(animesToday))
                } catch {
                    print("Error Decoding: \(error)")
                    completed(.failure(error))
                }
            }
        }
    }
    
    func getAnimeSeason(completed: @escaping (Result<Anime, Error>) -> Void) {
        AF.request(apiPath + animeSeasonEndpoint, method: .get).response { responseData in
            // 429 - Too Many Request -> Retry with a delay
            if responseData.response?.statusCode == 429 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.getAnimeSeason { result in
                        switch result {
                        case .success(let animes):
                            completed(.success(animes))
                        case .failure(let error):
                            completed(.failure(error))
                        }
                    }
                }
            } else {
                do {
                    let animeSeason = try JSONDecoder().decode(Anime.self, from: responseData.data ?? Data())
                    completed(.success(animeSeason))
                } catch {
                    print("Error Decoding: \(error)")
                    completed(.failure(error))
                }
            }
        }
    }
    
    func getAnimeTop(completed: @escaping (Result<Anime, Error>) -> Void) {
        AF.request(apiPath + animeTopEndpoint, method: .get).response { responseData in
            // 429 - Too Many Request -> Retry with a delay
            if responseData.response?.statusCode == 429 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.getAnimeTop { result in
                        switch result {
                        case .success(let animes):
                            completed(.success(animes))
                        case .failure(let error):
                            completed(.failure(error))
                        }
                    }
                }
            } else {
                do {
                    let animeTop = try JSONDecoder().decode(Anime.self, from: responseData.data ?? Data())
                    completed(.success(animeTop))
                } catch {
                    print("Error Decoding: \(error)")
                    completed(.failure(error))
                }
            }
        }
    }
    
    func getAnimeUpcoming(completed: @escaping (Result<Anime, Error>) -> Void) {
        AF.request(apiPath + animeUpcomingEndpoint, method: .get).response { responseData in
            // 429 - Too Many Request -> Retry with a delay
            if responseData.response?.statusCode == 429 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.getAnimeUpcoming { result in
                        switch result {
                        case .success(let animes):
                            completed(.success(animes))
                        case .failure(let error):
                            completed(.failure(error))
                        }
                    }
                }
            } else {
                do {
                    let animeUpcoming = try JSONDecoder().decode(Anime.self, from: responseData.data ?? Data())
                    completed(.success(animeUpcoming))
                } catch {
                    print("Error Decoding: \(error)")
                    completed(.failure(error))
                }
            }
        }
    }
    
    func searchAnime(q: String, completed: @escaping (Result<Anime, Error>) -> Void) {
        if (q == "") {
            AF.request(apiPath + searchLastestAnimeEndpoint, method: .get).response { responseData in
                // 429 - Too Many Request -> Retry with a delay
                if responseData.response?.statusCode == 429 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.self.searchAnime(q: q) { result in
                            switch result {
                            case .success(let animes):
                                completed(.success(animes))
                            case .failure(let error):
                                completed(.failure(error))
                            }
                        }
                    }
                } else {
                    do {
                        let animeSearch = try JSONDecoder().decode(Anime.self, from: responseData.data ?? Data())
                        completed(.success(animeSearch))
                    } catch {
                        print("Error Decoding: \(error)")
                        completed(.failure(error))
                    }
                }
            }
        } else {
            let searchEndpoint = "/anime?page=1&type=\(ServiceJikan.searchOptions.type)&status=\(ServiceJikan.searchOptions.status)&min_score=\(ServiceJikan.searchOptions.minScore)&max_score=\(ServiceJikan.searchOptions.maxScore)&rating=\(ServiceJikan.searchOptions.rating["\(ServiceJikan.searchOptions.ratingSelected)"] ?? "")&q=\((q.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""))"
            print("search endpo =====> \(searchEndpoint)")
            AF.request(apiPath + searchEndpoint, method: .get).response { responseData in
                // 429 - Too Many Request -> Retry with a delay
                if responseData.response?.statusCode == 429 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.searchAnime(q: q) { result in
                            switch result {
                            case .success(let animes):
                                completed(.success(animes))
                            case .failure(let error):
                                completed(.failure(error))
                            }
                        }
                    }
                } else {
                    do {
                        let animeSearch = try JSONDecoder().decode(Anime.self, from: responseData.data ?? Data())
                        completed(.success(animeSearch))
                    } catch {
                        print("Error Decoding: \(error)")
                        completed(.failure(error))
                    }
                }
            }
        }
    }
}
