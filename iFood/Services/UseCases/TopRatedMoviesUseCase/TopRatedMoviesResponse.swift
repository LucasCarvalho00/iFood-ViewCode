//
//  TopRatedMoviesResponse.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

struct TopRatedMoviesResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [TopRatedListResults]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

struct TopRatedListResults: Codable {
    let popularity: Double
    let voteCount: Int
    let posterPath: String
    let genreIds: [Int]
    let title: String
    let overview: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
        case title
        case overview
        case releaseDate = "release_date"
    }
}
