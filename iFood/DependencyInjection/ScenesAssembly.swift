//
//  ScenesAssembly.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

final class ScenesAssembly: ScenesAssemblyProtocol {

    // MARK: - Private Attributes
    
    private let foundationAssemblyProtocol: FoundationAssemblyProtocol
    
    // MARK: - Initializer
    
    init(
        foundationAssemblyProtocol: FoundationAssemblyProtocol
    ) {
        self.foundationAssemblyProtocol = foundationAssemblyProtocol
    }
    
    // MARK: - Internal Functions

    func makeGenreMovieUseCaseProtocol() -> GenreMovieUseCaseProtocol {
        GenreMovieUseCase(network: foundationAssemblyProtocol.makeNetworkOperationProtocol())
    }
    
    func makeTopRatedMoviesUseCaseProtocol() -> TopRatedMoviesUseCaseProtocol {
        TopRatedMoviesUseCase(network: foundationAssemblyProtocol.makeNetworkOperationProtocol())
    }
    
    func makeListViewProtocol() -> ListViewProtocol {
        ListView()
    }
    
    func makeListViewModelProtocol() -> ListViewModelProtocol {
        let topRatedMoviesUseCase = makeTopRatedMoviesUseCaseProtocol()
        return ListViewModel(topRatedMoviesUseCase: topRatedMoviesUseCase)
    }
    
    func makeListViewController() -> ListViewController {
        let view = makeListViewProtocol()
        var viewModel = makeListViewModelProtocol()
        let viewController = ListViewController(
            viewProtocol: view,
            viewModelProtocol: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
    
    func makeDetailViewProtocol() -> DetailViewProtocol {
        DetailView()
    }
    
    func makeDetailViewModelProtocol(entity: TopRatedMovieList) -> DetailViewModelProtocol {
        DetailViewModel(data: entity)
    }
    
    func makeDetailViewController(entity: TopRatedMovieList) -> DetailViewController {
        let view = makeDetailViewProtocol()
        var viewModel = makeDetailViewModelProtocol(entity: entity)
        let viewController = DetailViewController(
            viewProtocol: view,
            viewModelProtocol: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}
