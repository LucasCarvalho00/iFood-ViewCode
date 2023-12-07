//
//  ListView.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import UIKit

final class ListView: UIView {

    // MARK: - Delegates
    
    weak var delegate: ListViewViewControllerProtocol?

    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var viewLoading: ListLoadingView = {
        let view = ListLoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
        
    private lazy var viewError: ListErrorView = {
        let view = ListErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.isHidden = true
        return view
    }()
    
    private lazy var viewData: ListDataView = {
        let view = ListDataView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.isHidden = true
        return view
    }()
    
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func constraintUI() {
        addSubview(view)
        view.addSubview(viewError)
        view.addSubview(viewData)
        view.addSubview(viewLoading)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            viewLoading.topAnchor.constraint(equalTo: view.topAnchor),
            viewLoading.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewLoading.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewLoading.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            viewError.topAnchor.constraint(equalTo: view.topAnchor),
            viewError.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewError.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewError.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            viewData.topAnchor.constraint(equalTo: view.topAnchor),
            viewData.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewData.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewData.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    // MARK: - Private Functions
    
    private func setLoadingView(isLoading: Bool) {
        viewLoading.isHidden = !isLoading
        viewLoading.startLoad()
        viewError.isHidden = true
        viewData.isHidden = true
    }
    
    private func setDataView(data: TopRatedMovies) {
        viewLoading.stopLoad()
        viewError.isHidden = true
        viewLoading.isHidden = true
        viewData.isHidden = false
        viewData.setupUI(data: data)
    }

    private func setErrorView(message: String) {
        viewLoading.stopLoad()
        viewError.isHidden = false
        viewLoading.isHidden = true
        viewData.isHidden = true
        viewError.setupUI(message: message)
    }
}

// MARK: - Extensions

extension ListView: ListViewProtocol {
    func setupUI(state: ListState) {
        switch state {
        case let .isLoading(isLoading):
            setLoadingView(isLoading: isLoading)
        case let .hasData(data):
            setDataView(data: data)
        case let .hasError(message):
            setErrorView(message: message)
        }
    }
}

extension ListView: ListErrorViewDelegate {
    func didTapReload() {
        delegate?.didTapReload()
    }
}

extension ListView: ListDataViewDelegate {
    func didTapToMovie(data: TopRatedMovieList) {
        delegate?.didTapToMovie(data: data)
    }
}
