//
//  ListViewProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import UIKit

// MARK: - EnumState

enum ListState {
    case hasData(data: TopRatedMovies)
    case hasError(message: String)
    case isLoading(isLoading: Bool)
}

// MARK: - ViewController

protocol ListViewViewControllerProtocol: AnyObject {
    func didTapToMovie(data: TopRatedMovieList)
    func didTapReload()
}

// MARK: - View

protocol ListViewProtocol: UIView {
    var delegate: ListViewViewControllerProtocol? { get set }
    func setupUI(state: ListState)
}

protocol ListErrorViewDelegate: AnyObject {
    func didTapReload()
}

protocol ListDataViewDelegate: AnyObject {
    func didTapToMovie(data: TopRatedMovieList)
}
