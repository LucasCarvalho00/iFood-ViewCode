//
//  DependencyGraphProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

protocol DependencyGraphProtocol: AnyObject {
    func makeFlowController() -> FlowController
}
