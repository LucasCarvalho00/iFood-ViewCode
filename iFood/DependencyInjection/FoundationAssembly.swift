//
//  FoundationAssembly.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

final class FoundationAssembly: FoundationAssemblyProtocol {
        
    // MARK: - Internal Functions
    
    func makeFlowController(scenesFactoryProtocol: ScenesFactoryProtocol, navigationController: UINavigationController) -> FlowController {
        FlowController(
            navigationController: navigationController,
            factory: scenesFactoryProtocol)
    }
    
    func makeNetworkOperationProtocol() -> NetworkOperationProtocol {
        NetworkOperation(mockData: nil)
    }
}
