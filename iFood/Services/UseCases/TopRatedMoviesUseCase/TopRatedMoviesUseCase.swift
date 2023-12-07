//
//  TopRatedMoviesUseCase.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

class TopRatedMoviesUseCase {
    
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

extension TopRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol {
    func getTopRatedMovies(completion: @escaping (Result<TopRatedMoviesResponse, NetworkOperationError>) -> Void) {
        network.execute(request: ListRequests.getTopRatedMovies, completion: completion)
    }
}
