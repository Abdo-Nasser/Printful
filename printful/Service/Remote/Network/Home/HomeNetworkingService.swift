//
//  HomeNetworkingService.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Foundation

protocol HomeNetworkingServiceProtocol {
    func getListOfProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}

extension HomeNetworkingServiceProtocol {
    
    func getListOfProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let service = HomeNetworkingService()
        service.getListOfProducts(completion: completion) 
    }
}
