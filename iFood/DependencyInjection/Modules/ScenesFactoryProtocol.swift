//
//  ScenesFactoryProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

protocol ScenesFactoryProtocol {
    func makeListViewController() -> ListViewController
    func makeDetailViewController(entity: TopRatedMovieList) -> DetailViewController
}
