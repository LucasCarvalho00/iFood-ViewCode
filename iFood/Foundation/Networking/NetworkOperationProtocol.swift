//
//  NetworkOperationProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

protocol NetworkOperationProtocol {
    func execute<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void)
}
