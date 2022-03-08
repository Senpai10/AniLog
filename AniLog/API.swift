// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Media type enum, anime or manga.
public enum MediaType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Japanese Anime
  case anime
  /// Asian comic
  case manga
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ANIME": self = .anime
      case "MANGA": self = .manga
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .anime: return "ANIME"
      case .manga: return "MANGA"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaType, rhs: MediaType) -> Bool {
    switch (lhs, rhs) {
      case (.anime, .anime): return true
      case (.manga, .manga): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaType] {
    return [
      .anime,
      .manga,
    ]
  }
}

/// Source type the media was adapted from
public enum MediaSource: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// An original production not based of another work
  case original
  /// Asian comic book
  case manga
  /// Written work published in volumes
  case lightNovel
  /// Video game driven primary by text and narrative
  case visualNovel
  /// Video game
  case videoGame
  /// Other
  case other
  /// Version 2+ only. Written works not published in volumes
  case novel
  /// Version 2+ only. Self-published works
  case doujinshi
  /// Version 2+ only. Japanese Anime
  case anime
  /// Version 3 only. Written works published online
  case webNovel
  /// Version 3 only. Live action media such as movies or TV show
  case liveAction
  /// Version 3 only. Games excluding video games
  case game
  /// Version 3 only. Comics excluding manga
  case comic
  /// Version 3 only. Multimedia project
  case multimediaProject
  /// Version 3 only. Picture book
  case pictureBook
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ORIGINAL": self = .original
      case "MANGA": self = .manga
      case "LIGHT_NOVEL": self = .lightNovel
      case "VISUAL_NOVEL": self = .visualNovel
      case "VIDEO_GAME": self = .videoGame
      case "OTHER": self = .other
      case "NOVEL": self = .novel
      case "DOUJINSHI": self = .doujinshi
      case "ANIME": self = .anime
      case "WEB_NOVEL": self = .webNovel
      case "LIVE_ACTION": self = .liveAction
      case "GAME": self = .game
      case "COMIC": self = .comic
      case "MULTIMEDIA_PROJECT": self = .multimediaProject
      case "PICTURE_BOOK": self = .pictureBook
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .original: return "ORIGINAL"
      case .manga: return "MANGA"
      case .lightNovel: return "LIGHT_NOVEL"
      case .visualNovel: return "VISUAL_NOVEL"
      case .videoGame: return "VIDEO_GAME"
      case .other: return "OTHER"
      case .novel: return "NOVEL"
      case .doujinshi: return "DOUJINSHI"
      case .anime: return "ANIME"
      case .webNovel: return "WEB_NOVEL"
      case .liveAction: return "LIVE_ACTION"
      case .game: return "GAME"
      case .comic: return "COMIC"
      case .multimediaProject: return "MULTIMEDIA_PROJECT"
      case .pictureBook: return "PICTURE_BOOK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaSource, rhs: MediaSource) -> Bool {
    switch (lhs, rhs) {
      case (.original, .original): return true
      case (.manga, .manga): return true
      case (.lightNovel, .lightNovel): return true
      case (.visualNovel, .visualNovel): return true
      case (.videoGame, .videoGame): return true
      case (.other, .other): return true
      case (.novel, .novel): return true
      case (.doujinshi, .doujinshi): return true
      case (.anime, .anime): return true
      case (.webNovel, .webNovel): return true
      case (.liveAction, .liveAction): return true
      case (.game, .game): return true
      case (.comic, .comic): return true
      case (.multimediaProject, .multimediaProject): return true
      case (.pictureBook, .pictureBook): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaSource] {
    return [
      .original,
      .manga,
      .lightNovel,
      .visualNovel,
      .videoGame,
      .other,
      .novel,
      .doujinshi,
      .anime,
      .webNovel,
      .liveAction,
      .game,
      .comic,
      .multimediaProject,
      .pictureBook,
    ]
  }
}

/// The format the media was released in
public enum MediaFormat: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Anime broadcast on television
  case tv
  /// Anime which are under 15 minutes in length and broadcast on television
  case tvShort
  /// Anime movies with a theatrical release
  case movie
  /// Special episodes that have been included in DVD/Blu-ray releases, picture dramas, pilots, etc
  case special
  /// (Original Video Animation) Anime that have been released directly on DVD/Blu-ray without originally going through a theatrical release or television broadcast
  case ova
  /// (Original Net Animation) Anime that have been originally released online or are only available through streaming services.
  case ona
  /// Short anime released as a music video
  case music
  /// Professionally published manga with more than one chapter
  case manga
  /// Written books released as a series of light novels
  case novel
  /// Manga with just one chapter
  case oneShot
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "TV": self = .tv
      case "TV_SHORT": self = .tvShort
      case "MOVIE": self = .movie
      case "SPECIAL": self = .special
      case "OVA": self = .ova
      case "ONA": self = .ona
      case "MUSIC": self = .music
      case "MANGA": self = .manga
      case "NOVEL": self = .novel
      case "ONE_SHOT": self = .oneShot
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .tv: return "TV"
      case .tvShort: return "TV_SHORT"
      case .movie: return "MOVIE"
      case .special: return "SPECIAL"
      case .ova: return "OVA"
      case .ona: return "ONA"
      case .music: return "MUSIC"
      case .manga: return "MANGA"
      case .novel: return "NOVEL"
      case .oneShot: return "ONE_SHOT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaFormat, rhs: MediaFormat) -> Bool {
    switch (lhs, rhs) {
      case (.tv, .tv): return true
      case (.tvShort, .tvShort): return true
      case (.movie, .movie): return true
      case (.special, .special): return true
      case (.ova, .ova): return true
      case (.ona, .ona): return true
      case (.music, .music): return true
      case (.manga, .manga): return true
      case (.novel, .novel): return true
      case (.oneShot, .oneShot): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaFormat] {
    return [
      .tv,
      .tvShort,
      .movie,
      .special,
      .ova,
      .ona,
      .music,
      .manga,
      .novel,
      .oneShot,
    ]
  }
}

public enum MediaSeason: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Months December to February
  case winter
  /// Months March to May
  case spring
  /// Months June to August
  case summer
  /// Months September to November
  case fall
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "WINTER": self = .winter
      case "SPRING": self = .spring
      case "SUMMER": self = .summer
      case "FALL": self = .fall
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .winter: return "WINTER"
      case .spring: return "SPRING"
      case .summer: return "SUMMER"
      case .fall: return "FALL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaSeason, rhs: MediaSeason) -> Bool {
    switch (lhs, rhs) {
      case (.winter, .winter): return true
      case (.spring, .spring): return true
      case (.summer, .summer): return true
      case (.fall, .fall): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaSeason] {
    return [
      .winter,
      .spring,
      .summer,
      .fall,
    ]
  }
}

/// The type of ranking
public enum MediaRankType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Ranking is based on the media's ratings/score
  case rated
  /// Ranking is based on the media's popularity
  case popular
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "RATED": self = .rated
      case "POPULAR": self = .popular
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .rated: return "RATED"
      case .popular: return "POPULAR"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaRankType, rhs: MediaRankType) -> Bool {
    switch (lhs, rhs) {
      case (.rated, .rated): return true
      case (.popular, .popular): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaRankType] {
    return [
      .rated,
      .popular,
    ]
  }
}

public final class AnilistQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Anilist($idMal: Int) {
      Media(idMal: $idMal, type: ANIME) {
        __typename
        title {
          __typename
          romaji
          english
          native
        }
        coverImage {
          __typename
          extraLarge
          large
          medium
          color
        }
        bannerImage
        description
        episodes
        countryOfOrigin
        averageScore
        meanScore
        type
        genres
        source
        format
        duration
        isAdult
        updatedAt
        season
        seasonYear
        popularity
        startDate {
          __typename
          year
          month
          day
        }
        endDate {
          __typename
          year
          month
          day
        }
        rankings {
          __typename
          id
          rank
          type
          format
          allTime
          context
          year
          season
        }
        airingSchedule {
          __typename
          nodes {
            __typename
            id
            episode
            airingAt
            timeUntilAiring
          }
        }
        relations {
          __typename
          edges {
            __typename
            id
            node {
              __typename
              id
              idMal
              coverImage {
                __typename
                extraLarge
                large
                medium
                color
              }
              type
              title {
                __typename
                romaji
                english
                native
                userPreferred
              }
            }
          }
        }
        characters {
          __typename
          edges {
            __typename
            voiceActors {
              __typename
              id
              languageV2
              name {
                __typename
                first
                middle
                last
                full
                native
                userPreferred
              }
            }
            node {
              __typename
              id
              name {
                __typename
                first
                middle
                last
                full
                native
                userPreferred
              }
              image {
                __typename
                large
                medium
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "Anilist"

  public var idMal: Int?

  public init(idMal: Int? = nil) {
    self.idMal = idMal
  }

  public var variables: GraphQLMap? {
    return ["idMal": idMal]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Media", arguments: ["idMal": GraphQLVariable("idMal"), "type": "ANIME"], type: .object(Medium.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    /// Media query
    public var media: Medium? {
      get {
        return (resultMap["Media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Media"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .object(Title.selections)),
          GraphQLField("coverImage", type: .object(CoverImage.selections)),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("episodes", type: .scalar(Int.self)),
          GraphQLField("countryOfOrigin", type: .scalar(String.self)),
          GraphQLField("averageScore", type: .scalar(Int.self)),
          GraphQLField("meanScore", type: .scalar(Int.self)),
          GraphQLField("type", type: .scalar(MediaType.self)),
          GraphQLField("genres", type: .list(.scalar(String.self))),
          GraphQLField("source", type: .scalar(MediaSource.self)),
          GraphQLField("format", type: .scalar(MediaFormat.self)),
          GraphQLField("duration", type: .scalar(Int.self)),
          GraphQLField("isAdult", type: .scalar(Bool.self)),
          GraphQLField("updatedAt", type: .scalar(Int.self)),
          GraphQLField("season", type: .scalar(MediaSeason.self)),
          GraphQLField("seasonYear", type: .scalar(Int.self)),
          GraphQLField("popularity", type: .scalar(Int.self)),
          GraphQLField("startDate", type: .object(StartDate.selections)),
          GraphQLField("endDate", type: .object(EndDate.selections)),
          GraphQLField("rankings", type: .list(.object(Ranking.selections))),
          GraphQLField("airingSchedule", type: .object(AiringSchedule.selections)),
          GraphQLField("relations", type: .object(Relation.selections)),
          GraphQLField("characters", type: .object(Character.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: Title? = nil, coverImage: CoverImage? = nil, bannerImage: String? = nil, description: String? = nil, episodes: Int? = nil, countryOfOrigin: String? = nil, averageScore: Int? = nil, meanScore: Int? = nil, type: MediaType? = nil, genres: [String?]? = nil, source: MediaSource? = nil, format: MediaFormat? = nil, duration: Int? = nil, isAdult: Bool? = nil, updatedAt: Int? = nil, season: MediaSeason? = nil, seasonYear: Int? = nil, popularity: Int? = nil, startDate: StartDate? = nil, endDate: EndDate? = nil, rankings: [Ranking?]? = nil, airingSchedule: AiringSchedule? = nil, relations: Relation? = nil, characters: Character? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "bannerImage": bannerImage, "description": description, "episodes": episodes, "countryOfOrigin": countryOfOrigin, "averageScore": averageScore, "meanScore": meanScore, "type": type, "genres": genres, "source": source, "format": format, "duration": duration, "isAdult": isAdult, "updatedAt": updatedAt, "season": season, "seasonYear": seasonYear, "popularity": popularity, "startDate": startDate.flatMap { (value: StartDate) -> ResultMap in value.resultMap }, "endDate": endDate.flatMap { (value: EndDate) -> ResultMap in value.resultMap }, "rankings": rankings.flatMap { (value: [Ranking?]) -> [ResultMap?] in value.map { (value: Ranking?) -> ResultMap? in value.flatMap { (value: Ranking) -> ResultMap in value.resultMap } } }, "airingSchedule": airingSchedule.flatMap { (value: AiringSchedule) -> ResultMap in value.resultMap }, "relations": relations.flatMap { (value: Relation) -> ResultMap in value.resultMap }, "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The official titles of the media in various languages
      public var title: Title? {
        get {
          return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "title")
        }
      }

      /// The cover images of the media
      public var coverImage: CoverImage? {
        get {
          return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
        }
      }

      /// The banner image of the media
      public var bannerImage: String? {
        get {
          return resultMap["bannerImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bannerImage")
        }
      }

      /// Short description of the media's story and characters
      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// The amount of episodes the anime has when complete
      public var episodes: Int? {
        get {
          return resultMap["episodes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "episodes")
        }
      }

      /// Where the media was created. (ISO 3166-1 alpha-2)
      public var countryOfOrigin: String? {
        get {
          return resultMap["countryOfOrigin"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "countryOfOrigin")
        }
      }

      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? {
        get {
          return resultMap["averageScore"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "averageScore")
        }
      }

      /// Mean score of all the user's scores of the media
      public var meanScore: Int? {
        get {
          return resultMap["meanScore"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "meanScore")
        }
      }

      /// The type of the media; anime or manga
      public var type: MediaType? {
        get {
          return resultMap["type"] as? MediaType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      /// The genres of the media
      public var genres: [String?]? {
        get {
          return resultMap["genres"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "genres")
        }
      }

      /// Source type the media was adapted from.
      public var source: MediaSource? {
        get {
          return resultMap["source"] as? MediaSource
        }
        set {
          resultMap.updateValue(newValue, forKey: "source")
        }
      }

      /// The format the media was released in
      public var format: MediaFormat? {
        get {
          return resultMap["format"] as? MediaFormat
        }
        set {
          resultMap.updateValue(newValue, forKey: "format")
        }
      }

      /// The general length of each anime episode in minutes
      public var duration: Int? {
        get {
          return resultMap["duration"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "duration")
        }
      }

      /// If the media is intended only for 18+ adult audiences
      public var isAdult: Bool? {
        get {
          return resultMap["isAdult"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAdult")
        }
      }

      /// When the media's data was last updated
      public var updatedAt: Int? {
        get {
          return resultMap["updatedAt"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      /// The season the media was initially released in
      public var season: MediaSeason? {
        get {
          return resultMap["season"] as? MediaSeason
        }
        set {
          resultMap.updateValue(newValue, forKey: "season")
        }
      }

      /// The season year the media was initially released in
      public var seasonYear: Int? {
        get {
          return resultMap["seasonYear"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "seasonYear")
        }
      }

      /// The number of users with the media on their list
      public var popularity: Int? {
        get {
          return resultMap["popularity"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "popularity")
        }
      }

      /// The first official release date of the media
      public var startDate: StartDate? {
        get {
          return (resultMap["startDate"] as? ResultMap).flatMap { StartDate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "startDate")
        }
      }

      /// The last official release date of the media
      public var endDate: EndDate? {
        get {
          return (resultMap["endDate"] as? ResultMap).flatMap { EndDate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "endDate")
        }
      }

      /// The ranking of the media in a particular time span and format compared to other media
      public var rankings: [Ranking?]? {
        get {
          return (resultMap["rankings"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Ranking?] in value.map { (value: ResultMap?) -> Ranking? in value.flatMap { (value: ResultMap) -> Ranking in Ranking(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Ranking?]) -> [ResultMap?] in value.map { (value: Ranking?) -> ResultMap? in value.flatMap { (value: Ranking) -> ResultMap in value.resultMap } } }, forKey: "rankings")
        }
      }

      /// The media's entire airing schedule
      public var airingSchedule: AiringSchedule? {
        get {
          return (resultMap["airingSchedule"] as? ResultMap).flatMap { AiringSchedule(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "airingSchedule")
        }
      }

      /// Other media in the same or connecting franchise
      public var relations: Relation? {
        get {
          return (resultMap["relations"] as? ResultMap).flatMap { Relation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "relations")
        }
      }

      /// The characters in the media
      public var characters: Character? {
        get {
          return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "characters")
        }
      }

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaTitle"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("romaji", type: .scalar(String.self)),
            GraphQLField("english", type: .scalar(String.self)),
            GraphQLField("native", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(romaji: String? = nil, english: String? = nil, native: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji, "english": english, "native": native])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The romanization of the native language title
        public var romaji: String? {
          get {
            return resultMap["romaji"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "romaji")
          }
        }

        /// The official english title
        public var english: String? {
          get {
            return resultMap["english"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "english")
          }
        }

        /// Official title in it's native language
        public var native: String? {
          get {
            return resultMap["native"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "native")
          }
        }
      }

      public struct CoverImage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaCoverImage"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("extraLarge", type: .scalar(String.self)),
            GraphQLField("large", type: .scalar(String.self)),
            GraphQLField("medium", type: .scalar(String.self)),
            GraphQLField("color", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(extraLarge: String? = nil, large: String? = nil, medium: String? = nil, color: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "extraLarge": extraLarge, "large": large, "medium": medium, "color": color])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
        public var extraLarge: String? {
          get {
            return resultMap["extraLarge"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "extraLarge")
          }
        }

        /// The cover image url of the media at a large size
        public var large: String? {
          get {
            return resultMap["large"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "large")
          }
        }

        /// The cover image url of the media at medium size
        public var medium: String? {
          get {
            return resultMap["medium"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "medium")
          }
        }

        /// Average #hex color of cover image
        public var color: String? {
          get {
            return resultMap["color"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "color")
          }
        }
      }

      public struct StartDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
            GraphQLField("day", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(year: Int? = nil, month: Int? = nil, day: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "year": year, "month": month, "day": day])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Numeric Year (2017)
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }

        /// Numeric Day (24)
        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }
      }

      public struct EndDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
            GraphQLField("day", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(year: Int? = nil, month: Int? = nil, day: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "year": year, "month": month, "day": day])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Numeric Year (2017)
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }

        /// Numeric Day (24)
        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaRank"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("rank", type: .nonNull(.scalar(Int.self))),
            GraphQLField("type", type: .nonNull(.scalar(MediaRankType.self))),
            GraphQLField("format", type: .nonNull(.scalar(MediaFormat.self))),
            GraphQLField("allTime", type: .scalar(Bool.self)),
            GraphQLField("context", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("season", type: .scalar(MediaSeason.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, rank: Int, type: MediaRankType, format: MediaFormat, allTime: Bool? = nil, context: String, year: Int? = nil, season: MediaSeason? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaRank", "id": id, "rank": rank, "type": type, "format": format, "allTime": allTime, "context": context, "year": year, "season": season])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the rank
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The numerical rank of the media
        public var rank: Int {
          get {
            return resultMap["rank"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rank")
          }
        }

        /// The type of ranking
        public var type: MediaRankType {
          get {
            return resultMap["type"]! as! MediaRankType
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The format the media is ranked within
        public var format: MediaFormat {
          get {
            return resultMap["format"]! as! MediaFormat
          }
          set {
            resultMap.updateValue(newValue, forKey: "format")
          }
        }

        /// If the ranking is based on all time instead of a season/year
        public var allTime: Bool? {
          get {
            return resultMap["allTime"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "allTime")
          }
        }

        /// String that gives context to the ranking type and time span
        public var context: String {
          get {
            return resultMap["context"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "context")
          }
        }

        /// The year the media is ranked within
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// The season the media is ranked within
        public var season: MediaSeason? {
          get {
            return resultMap["season"] as? MediaSeason
          }
          set {
            resultMap.updateValue(newValue, forKey: "season")
          }
        }
      }

      public struct AiringSchedule: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AiringScheduleConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "AiringScheduleConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["AiringSchedule"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("episode", type: .nonNull(.scalar(Int.self))),
              GraphQLField("airingAt", type: .nonNull(.scalar(Int.self))),
              GraphQLField("timeUntilAiring", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, episode: Int, airingAt: Int, timeUntilAiring: Int) {
            self.init(unsafeResultMap: ["__typename": "AiringSchedule", "id": id, "episode": episode, "airingAt": airingAt, "timeUntilAiring": timeUntilAiring])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the airing schedule item
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The airing episode number
          public var episode: Int {
            get {
              return resultMap["episode"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "episode")
            }
          }

          /// The time the episode airs at
          public var airingAt: Int {
            get {
              return resultMap["airingAt"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "airingAt")
            }
          }

          /// Seconds until episode starts airing
          public var timeUntilAiring: Int {
            get {
              return resultMap["timeUntilAiring"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "timeUntilAiring")
            }
          }
        }
      }

      public struct Relation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(Int.self)),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int? = nil, node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaEdge", "id": id, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the connection
          public var id: Int? {
            get {
              return resultMap["id"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("idMal", type: .scalar(Int.self)),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
                GraphQLField("type", type: .scalar(MediaType.self)),
                GraphQLField("title", type: .object(Title.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, idMal: Int? = nil, coverImage: CoverImage? = nil, type: MediaType? = nil, title: Title? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "idMal": idMal, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "type": type, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the media
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The mal id of the media
            public var idMal: Int? {
              get {
                return resultMap["idMal"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "idMal")
              }
            }

            /// The cover images of the media
            public var coverImage: CoverImage? {
              get {
                return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
              }
            }

            /// The type of the media; anime or manga
            public var type: MediaType? {
              get {
                return resultMap["type"] as? MediaType
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            /// The official titles of the media in various languages
            public var title: Title? {
              get {
                return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "title")
              }
            }

            public struct CoverImage: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MediaCoverImage"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("extraLarge", type: .scalar(String.self)),
                  GraphQLField("large", type: .scalar(String.self)),
                  GraphQLField("medium", type: .scalar(String.self)),
                  GraphQLField("color", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(extraLarge: String? = nil, large: String? = nil, medium: String? = nil, color: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "extraLarge": extraLarge, "large": large, "medium": medium, "color": color])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
              public var extraLarge: String? {
                get {
                  return resultMap["extraLarge"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "extraLarge")
                }
              }

              /// The cover image url of the media at a large size
              public var large: String? {
                get {
                  return resultMap["large"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "large")
                }
              }

              /// The cover image url of the media at medium size
              public var medium: String? {
                get {
                  return resultMap["medium"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "medium")
                }
              }

              /// Average #hex color of cover image
              public var color: String? {
                get {
                  return resultMap["color"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "color")
                }
              }
            }

            public struct Title: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MediaTitle"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("romaji", type: .scalar(String.self)),
                  GraphQLField("english", type: .scalar(String.self)),
                  GraphQLField("native", type: .scalar(String.self)),
                  GraphQLField("userPreferred", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(romaji: String? = nil, english: String? = nil, native: String? = nil, userPreferred: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji, "english": english, "native": native, "userPreferred": userPreferred])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The romanization of the native language title
              public var romaji: String? {
                get {
                  return resultMap["romaji"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "romaji")
                }
              }

              /// The official english title
              public var english: String? {
                get {
                  return resultMap["english"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "english")
                }
              }

              /// Official title in it's native language
              public var native: String? {
                get {
                  return resultMap["native"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "native")
                }
              }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? {
                get {
                  return resultMap["userPreferred"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "userPreferred")
                }
              }
            }
          }
        }
      }

      public struct Character: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CharacterConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "CharacterConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CharacterEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("voiceActors", type: .list(.object(VoiceActor.selections))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(voiceActors: [VoiceActor?]? = nil, node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "CharacterEdge", "voiceActors": voiceActors.flatMap { (value: [VoiceActor?]) -> [ResultMap?] in value.map { (value: VoiceActor?) -> ResultMap? in value.flatMap { (value: VoiceActor) -> ResultMap in value.resultMap } } }, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The voice actors of the character
          public var voiceActors: [VoiceActor?]? {
            get {
              return (resultMap["voiceActors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [VoiceActor?] in value.map { (value: ResultMap?) -> VoiceActor? in value.flatMap { (value: ResultMap) -> VoiceActor in VoiceActor(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [VoiceActor?]) -> [ResultMap?] in value.map { (value: VoiceActor?) -> ResultMap? in value.flatMap { (value: VoiceActor) -> ResultMap in value.resultMap } } }, forKey: "voiceActors")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct VoiceActor: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Staff"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("languageV2", type: .scalar(String.self)),
                GraphQLField("name", type: .object(Name.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, languageV2: String? = nil, name: Name? = nil) {
              self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "languageV2": languageV2, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the staff member
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The primary language of the staff member. Current values: Japanese, English, Korean, Italian, Spanish, Portuguese, French, German, Hebrew, Hungarian, Chinese, Arabic, Filipino, Catalan
            public var languageV2: String? {
              get {
                return resultMap["languageV2"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "languageV2")
              }
            }

            /// The names of the staff member
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("first", type: .scalar(String.self)),
                  GraphQLField("middle", type: .scalar(String.self)),
                  GraphQLField("last", type: .scalar(String.self)),
                  GraphQLField("full", type: .scalar(String.self)),
                  GraphQLField("native", type: .scalar(String.self)),
                  GraphQLField("userPreferred", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(first: String? = nil, middle: String? = nil, last: String? = nil, full: String? = nil, native: String? = nil, userPreferred: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "StaffName", "first": first, "middle": middle, "last": last, "full": full, "native": native, "userPreferred": userPreferred])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's given name
              public var first: String? {
                get {
                  return resultMap["first"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "first")
                }
              }

              /// The person's middle name
              public var middle: String? {
                get {
                  return resultMap["middle"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "middle")
                }
              }

              /// The person's surname
              public var last: String? {
                get {
                  return resultMap["last"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "last")
                }
              }

              /// The person's first and last name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }

              /// The person's full name in their native language
              public var native: String? {
                get {
                  return resultMap["native"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "native")
                }
              }

              /// The currently authenticated users preferred name language. Default romaji for non-authenticated
              public var userPreferred: String? {
                get {
                  return resultMap["userPreferred"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "userPreferred")
                }
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Character"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .object(Name.selections)),
                GraphQLField("image", type: .object(Image.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: Name? = nil, image: Image? = nil) {
              self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the character
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The names of the character
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            /// Character images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CharacterName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("first", type: .scalar(String.self)),
                  GraphQLField("middle", type: .scalar(String.self)),
                  GraphQLField("last", type: .scalar(String.self)),
                  GraphQLField("full", type: .scalar(String.self)),
                  GraphQLField("native", type: .scalar(String.self)),
                  GraphQLField("userPreferred", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(first: String? = nil, middle: String? = nil, last: String? = nil, full: String? = nil, native: String? = nil, userPreferred: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "CharacterName", "first": first, "middle": middle, "last": last, "full": full, "native": native, "userPreferred": userPreferred])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The character's given name
              public var first: String? {
                get {
                  return resultMap["first"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "first")
                }
              }

              /// The character's middle name
              public var middle: String? {
                get {
                  return resultMap["middle"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "middle")
                }
              }

              /// The character's surname
              public var last: String? {
                get {
                  return resultMap["last"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "last")
                }
              }

              /// The character's first and last name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }

              /// The character's full name in their native language
              public var native: String? {
                get {
                  return resultMap["native"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "native")
                }
              }

              /// The currently authenticated users preferred name language. Default romaji for non-authenticated
              public var userPreferred: String? {
                get {
                  return resultMap["userPreferred"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "userPreferred")
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CharacterImage"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("large", type: .scalar(String.self)),
                  GraphQLField("medium", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(large: String? = nil, medium: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "CharacterImage", "large": large, "medium": medium])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The character's image of media at its largest size
              public var large: String? {
                get {
                  return resultMap["large"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "large")
                }
              }

              /// The character's image of media at medium size
              public var medium: String? {
                get {
                  return resultMap["medium"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "medium")
                }
              }
            }
          }
        }
      }
    }
  }
}
