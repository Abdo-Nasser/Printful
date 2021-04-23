//
//  ProductContract.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Foundation

//MARK: - VIPER

//MARK: - RouterAction
enum ProductRouterAction {
    case back
}

protocol ProductRouterProtocol {
    func go(to: ProductRouterAction)
}

//MARK: - Presenter
protocol ProductPresenterProtocol: class {
    var viewModel: ProductViewModel { get set }
    
    func attach()
    func back()
}

//MARK: - Interactor
protocol ProductInteractorProtocol: class {
}

//MARK: - ViewProtocol
protocol ProductViewControllerProtocol: class {
    var presenter: ProductPresenterProtocol? { get set }
}
