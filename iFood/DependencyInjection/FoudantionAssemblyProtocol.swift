//
//  FoudantionAssemblyProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

protocol FoundationAssemblyProtocol {
    func makeFlowController(scenesFactoryProtocol: ScenesFactoryProtocol, navigationController: UINavigationController) -> FlowController
    func makeNetworkOperationProtocol() -> NetworkOperationProtocol
}
