//
//  FlowController+iFood.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//


// MARK: - ListViewController

extension FlowController: ListViewFlowProtocol {
    func goToDetail(with data: TopRatedMovieList) {
        let viewController = factory.makeDetailViewController(entity: data)
        viewController.flowProtocol = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - DetailViewController

extension FlowController: DetailViewFlowProtocol { }
