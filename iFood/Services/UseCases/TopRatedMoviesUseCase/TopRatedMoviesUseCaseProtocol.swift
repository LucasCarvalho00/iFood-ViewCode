//
//  TopRatedMoviesUseCaseProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

protocol TopRatedMoviesUseCaseProtocol {
    func getTopRatedMovies(completion: @escaping (Result<TopRatedMoviesResponse, NetworkOperationError>) -> Void)
}
