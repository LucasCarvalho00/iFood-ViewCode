//
//  DetailViewProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import UIKit

// MARK: - EnumState

enum DetailState {
    case hasData(data: TopRatedMovieList)
}

// MARK: - ViewController

protocol DetailViewViewControllerProtocol: AnyObject { }

// MARK: - View

protocol DetailViewProtocol: UIView {
    var delegate: DetailViewViewControllerProtocol? { get set }
    func setupUI(state: DetailState)
}
