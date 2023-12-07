//
//  File.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation

fileprivate class NetworkOperationBundle { }

final class NetworkOperation {

    // MARK: - Private Attributes
    
    private let mockData: Data?

    // MARK: - Setup

    init(
        mockData: Data? = nil
    ) {
        self.mockData = mockData
    }
    
    // MARK: - Private Functions

    private func executeNetwork<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {

        guard let objectURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL"), let baseURL = objectURL as? String else {
            DispatchQueue.main.async {
                completion(.failure(.noBaseURL))
            }
            return
        }
    
        guard let objectKeyURL = Bundle.main.object(forInfoDictionaryKey: "KeyURL"), let keyURL = objectKeyURL as? String else {
            DispatchQueue.main.async {
                completion(.failure(.noKeyURL))
            }
            return
        }
        
        let apiStringURL = baseURL + request.path + keyURL
            
        guard let apiURL = getURL(apiStringURL: apiStringURL, request: request) else {
            DispatchQueue.main.async {
                completion(.failure(.noURL))
            }
            return
        }
                
        var urlRequest = URLRequest(url: apiURL)
    
        if let headersRequest = request.headers {
            for (key,value) in headersRequest {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
            
        if let parameters = request.parameters {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
                urlRequest.httpBody = jsonData
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.erroParameters))
                }
            }
        }
        
        urlRequest.httpMethod = request.method.rawValue
            
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard let jsonData = data else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }
            
            self?.parseObject(jsonData: jsonData, completion: completion)
        }
                    
        task.resume()
    }
    
    private func executeMockNetwork<T: Decodable>(mockData: Data, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {
        parseObject(jsonData: mockData, completion: completion)
    }
    
    private func parseObject<T: Decodable>(jsonData: Data, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(T.self, from: jsonData)
            DispatchQueue.main.async {
                completion(.success(decoded))
            }
        } catch {
            DispatchQueue.main.async {
                completion(.failure(.erroParsable))
            }
        }
    }
}

// MARK: - Extensions

extension NetworkOperation: NetworkOperationProtocol {
    func execute<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {
        if let mockData = mockData {
            executeMockNetwork(mockData: mockData, completion: completion)
        } else {
            executeNetwork(request: request, completion: completion)
        }
    }
}
