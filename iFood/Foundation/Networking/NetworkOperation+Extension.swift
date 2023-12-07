//
//  NetworkOperation+Extension.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

extension NetworkOperation {
    func getURL(apiStringURL: String, request: RequestProtocol) -> URL? {
        switch request.method {
        case .GET:
            guard var components = URLComponents(string: apiStringURL) else {
                return nil
            }
            
            if let parameters = request.parameters {
                var queryItens: [URLQueryItem] = []
                for (key, value) in parameters {
                    queryItens.append(URLQueryItem(name: key, value: value as? String))
                }
                components.queryItems = queryItens
            }
            
            return components.url
        default:
            return URL(string: apiStringURL)
        }
    }
    
    func getData(name: String, withExtension: String = "json") -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let fileUrl = bundle.url(forResource: name, withExtension: withExtension) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch {
            return nil
        }
    }
}
