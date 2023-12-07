//
//  GenreMovieUseCaseProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

protocol GenreMovieUseCaseProtocol {
    func getGenreMovie(completion: @escaping (Result<GenreMovieResponse, NetworkOperationError>) -> Void)
}
