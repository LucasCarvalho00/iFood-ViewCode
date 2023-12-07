//
//  RequestProtocol.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

protocol RequestProtocol {
    var path: String { get }
    var method: NetworkingRequestMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var requestMock: String? { get }
}
