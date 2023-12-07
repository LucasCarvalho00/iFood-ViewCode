//
//  DependencyGraph.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

final class DependencyGraph: DependencyGraphProtocol {
    
    // MARK: - Private Attributes
    
    private let navigationController: UINavigationController
    private let foundationAssemblyProtocol: FoundationAssemblyProtocol
    private let scenesFactoryProtocol: ScenesFactoryProtocol
    private let scenesAssemblyProtocol: ScenesAssemblyProtocol

    // MARK: - Initializer
    
    init(
        navigationController: UINavigationController
    ) {
        self.foundationAssemblyProtocol = FoundationAssembly()
        self.scenesAssemblyProtocol = ScenesAssembly(foundationAssemblyProtocol: foundationAssemblyProtocol)
        self.navigationController = navigationController
        self.scenesFactoryProtocol = ScenesFactory(scenesAssemblyProtocol: scenesAssemblyProtocol)
    }
    
    // MARK: - Internal Functions

    func makeFlowController() -> FlowController {
        FlowController(navigationController: navigationController, factory: scenesFactoryProtocol)
    }
}
