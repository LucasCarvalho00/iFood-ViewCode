//
//  iFoodAssemblyProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

protocol ScenesAssemblyProtocol {
    func makeListViewProtocol() -> ListViewProtocol
    func makeListViewModelProtocol() -> ListViewModelProtocol
    func makeListViewController() -> ListViewController
    func makeDetailViewProtocol() -> DetailViewProtocol
    func makeDetailViewModelProtocol(entity: TopRatedMovieList) -> DetailViewModelProtocol
    func makeDetailViewController(entity: TopRatedMovieList) -> DetailViewController
    func makeGenreMovieUseCaseProtocol() -> GenreMovieUseCaseProtocol
    func makeTopRatedMoviesUseCaseProtocol() -> TopRatedMoviesUseCaseProtocol
}
