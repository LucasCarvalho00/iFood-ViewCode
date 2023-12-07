//
//  GenreMovieUseCase.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation

class GenreMovieUseCase {
    
    // MARK: - Private Attributes

    private let network: NetworkOperationProtocol

    // MARK: - Setup

    init(
        network: NetworkOperationProtocol
    ) {
        self.network = network
    }
}

// MARK: - Extensions

extension GenreMovieUseCase: GenreMovieUseCaseProtocol {
    func getGenreMovie(completion: @escaping (Result<GenreMovieResponse, NetworkOperationError>) -> Void) {
        network.execute(request: ListRequests.getGenreMovie, completion: completion)
    }
}
