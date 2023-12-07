//
//  ListProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation

// MARK: - ViewController

protocol ListViewControllerProtocol: AnyObject {
    func setupUI(state: ListState)
}

// MARK: - ViewModel

protocol ListViewModelProtocol {
    var viewController: ListViewControllerProtocol? { get set }
    func viewDidLoad()
}

// MARK: - FlowController

protocol ListViewFlowProtocol: AnyObject {
    func goToDetail(with data: TopRatedMovieList)
}
