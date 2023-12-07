//
//  ListViewController.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
        
    // MARK: - Constants

    private enum Constants {
        static let title: String = NSLocalizedString("Lista de filmes", comment: "")
    }
    
    // MARK: - Private Attributes

    private let viewProtocol: ListViewProtocol
    private let viewModelProtocol: ListViewModelProtocol

    // MARK: - Public Attributes

    public var flowProtocol: ListViewFlowProtocol?
    
    // MARK: - Setup

    init(
        viewProtocol: ListViewProtocol,
        viewModelProtocol: ListViewModelProtocol
    ) {
        self.viewProtocol = viewProtocol
        self.viewModelProtocol = viewModelProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = viewProtocol
        view.delegate = self
        self.view = view
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.title
        loadData()
    }
    
    // MARK: - Private Functions

    private func loadData() {
        viewModelProtocol.viewDidLoad()
    }
}

// MARK: - Extensions

extension ListViewController: ListViewControllerProtocol {
    func setupUI(state: ListState) {
        viewProtocol.setupUI(state: state)
    }
}

extension ListViewController: ListViewViewControllerProtocol {
    func didTapReload() {
        viewModelProtocol.viewDidLoad()
    }
    
    func didTapToMovie(data: TopRatedMovieList) {
        flowProtocol?.goToDetail(with: data)
    }
}
