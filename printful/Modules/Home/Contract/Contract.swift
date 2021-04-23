//
//  Contract.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Foundation

//MARK: - VIPER

//MARK: - RouterAction
enum HomeRouterAction {
    case openProduct(Product: Product)
}

protocol HomeRouterProtocol {
    func go(to: HomeRouterAction)
}

//MARK: - Presenter
protocol HomePresenterProtocol: class {
    var viewModel: HomeViewModel { get set }
    
    func attach()
    func openProduct(_ product: Product)
}

//MARK: - Interactor
protocol HomeInteractorProtocol: HomeNetworkingServiceProtocol {
}

//MARK: - ViewProtocol
protocol HomeViewControllerProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
    func UpdateUI()
    func showLoading(_ show: Bool)
}
