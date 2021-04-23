//
//  Base.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Foundation

//MARK: - Switch live to testing and the otherwise
enum NetworkServiceType {
    case live
    case test
}

//MARK: - Response
public struct BaseResponse<T: Codable>: Codable {
    public var status: Int?
    public var data: T?
    public var error: error?
}

//MARK: - Error
public struct error: Codable {
    var code: Int = 0
    var message: String = ""
}

