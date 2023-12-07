//
//  ListRequests.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation

enum ListRequests: RequestProtocol {
    
    // MARK: - Case

    case getTopRatedMovies
    case getGenreMovie

    // MARK: - Properties

    var path: String {
        switch self {
        case .getTopRatedMovies:
            return "movie/top_rated"
        case .getGenreMovie:
            return "genre/movie/list"
        }
    }

    var method: NetworkingRequestMethod {
        switch self {
        case .getTopRatedMovies:
            return .GET
        case .getGenreMovie:
            return .GET
        }
    }
    
    var parameters: [String: Any]? {
        return nil
    }

    var headers: [String: String]? {
        return nil
    }
    
    var requestMock: String? {
        return nil
    }
}
