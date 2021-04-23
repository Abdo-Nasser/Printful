//
//  HomeAPI.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Moya

enum HomeAPI {
    case getListOfProducts
}

extension HomeAPI: TargetType, BaseAPIHeadersProtocol {
    var baseURL: URL {
        let stringURL = Constants.baseURL
        guard let url = URL(string: stringURL) else { fatalError("stringURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .getListOfProducts: return "/products"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getListOfProducts:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return commonHeaders
    }
    
    var task: Task {
        switch self {
        case .getListOfProducts:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
}
