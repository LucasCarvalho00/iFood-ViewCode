//
//  DetailProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation

// MARK: - ViewController

protocol DetailViewControllerProtocol: AnyObject {
    func setupUI(state: DetailState)
}

// MARK: - ViewModel

protocol DetailViewModelProtocol {
    var viewController: DetailViewControllerProtocol? { get set }
    func viewDidLoad()
}

// MARK: - FlowController

protocol DetailViewFlowProtocol: AnyObject { }
