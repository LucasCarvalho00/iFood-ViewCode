//
//  ListViewModel.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

class ListViewModel {

    // MARK: - Constants
    
    private enum Constants {
        static let posterPath = "PosterPath"
    }
    
    // MARK: - Public Attributes

    public weak var viewController: ListViewControllerProtocol?
    
    // MARK: - Private Attributes
    
    private let topRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol
    
    // MARK: - Setup

    init(topRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol) {
        self.topRatedMoviesUseCase = topRatedMoviesUseCase
    }
    
    // MARK: Private Functions
    
    private func initScreen() {
        viewController?.setupUI(state: .isLoading(isLoading: true))
        callService()
    }
    
    private func callService() {
        topRatedMoviesUseCase.getTopRatedMovies { [weak self] result in
            switch result {
            case let .success(response):
                self?.createCustomModel(response: response)
            case let .failure(error):
                self?.viewController?.setupUI(state: .hasError(message: error.text))
            }
        }
    }
    
    private func createCustomModel(response: TopRatedMoviesResponse) {
        let data = TopRatedMovies(
            page: response.page,
            totalResults: response.totalPages,
            totalPages: response.totalPages,
            results: makeTopRatedMovieList(results: response.results))
        viewController?.setupUI(state: .hasData(data: data))
    }
                                     
    private func makeTopRatedMovieList(results: [TopRatedListResults]) -> [TopRatedMovieList] {
        var list: [TopRatedMovieList] = []
        
        guard let urlPosterPath = Bundle.main.object(forInfoDictionaryKey: Constants.posterPath), let posterPath = urlPosterPath as? String else {
            return list
        }
        
        results.forEach { item in
            list.append(TopRatedMovieList(
                popularity: item.popularity,
                voteCount: item.voteCount,
                posterPath: posterPath + item.posterPath,
                genreIds: item.genreIds,
                title: item.title,
                overview: item.overview,
                releaseDate: item.releaseDate))
        }
        return list
    }
}

// MARK: - Extensions

extension ListViewModel: ListViewModelProtocol {
    func viewDidLoad() {
        initScreen()
    }
}
