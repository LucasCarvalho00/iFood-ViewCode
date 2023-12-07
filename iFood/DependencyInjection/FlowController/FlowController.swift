//
//  FlowController.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

final class FlowController {
    
    // MARK: - Internal Attributes

    weak var navigationController: UINavigationController?
    let factory: ScenesFactoryProtocol

    // MARK: - Setup

    init(navigationController: UINavigationController,
         factory: ScenesFactoryProtocol) {
        self.navigationController = navigationController
        self.factory = factory
    }
        
    // MARK: - Internal Functions

    func start() {
        let viewController = factory.makeListViewController()
        viewController.flowProtocol = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}
