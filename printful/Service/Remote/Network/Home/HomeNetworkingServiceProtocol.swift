//
//  HomeNetworkingServiceProtocol.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Foundation

class HomeNetworkingService: MoyaServiceHelper<HomeAPI> {
    func getListOfProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        request(target: .getListOfProducts, completion: completion) 
    }
}
