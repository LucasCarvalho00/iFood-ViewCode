//
//  ScenesFactory.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

final class ScenesFactory: ScenesFactoryProtocol {
            
    // MARK: - Private Attributes

    private let scenesAssemblyProtocol: ScenesAssemblyProtocol
    
    // MARK: - Initializer
   
    init(
        scenesAssemblyProtocol: ScenesAssemblyProtocol
    ) {
        self.scenesAssemblyProtocol = scenesAssemblyProtocol
    }
    
    // MARK: - Internal Functions
    
    func makeListViewController() -> ListViewController {
        scenesAssemblyProtocol.makeListViewController()
    }
    
    func makeDetailViewController(entity: TopRatedMovieList) -> DetailViewController {
        scenesAssemblyProtocol.makeDetailViewController(entity: entity)
    }
}
