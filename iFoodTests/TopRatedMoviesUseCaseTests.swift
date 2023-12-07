//
//  TopRatedMoviesUseCaseTests.swift
//  iFoodTests
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import XCTest
@testable import iFood

class TopRatedMoviesUseCaseTests: XCTestCase {

    // MARK: - LifeCycle

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    // MARK: - Private Functions

    private func getData(name: String, withExtension: String = "json") -> Data? {
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
    
    // MARK: - Tests

    func testTopRatedUseCaseSuccessfully() throws {
        guard let data = getData(name: "topRatedUseCaseSuccessfullyMock") else {
            XCTAssertTrue(false,"No data")
            return
        }
        
        let network: NetworkOperationProtocol = NetworkOperation(mockData: data)
        let useCase: TopRatedMoviesUseCaseProtocol = TopRatedMoviesUseCase(network: network)

        useCase.getTopRatedMovies { result in
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure:
                XCTAssertTrue(false)
            }
        }
    }
    
    func testTopRatedUseCaseError() throws {
        guard let data = getData(name: "topRatedUseCaseErrorMock") else {
            XCTAssertTrue(false,"No data")
            return
        }
        
        let network: NetworkOperationProtocol = NetworkOperation(mockData: data)
        let useCase: TopRatedMoviesUseCaseProtocol = TopRatedMoviesUseCase(network: network)

        useCase.getTopRatedMovies { result in
            switch result {
            case .success:
                XCTAssertTrue(false)
            case .failure:
                XCTAssertTrue(true)
            }
        }
    }
}
