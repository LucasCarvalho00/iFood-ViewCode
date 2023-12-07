//
//  GenreMovieResponse.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation

struct GenreMovieResponse: Codable {
    let genres: [GenreMovieListResults]
}

struct GenreMovieListResults: Codable {
    let id: Int
    let name: String
}
