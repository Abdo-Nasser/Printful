//
//  HomeRouter.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    
    weak var view: UIViewController?
    
    static func createHomeModule() -> UIViewController{
        let view = HomeViewController()
        let viewModel = HomeViewModel()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router, viewModel: viewModel)
        
        view.presenter = presenter
        router.view = view
        return view
    }
    
    func go(to: HomeRouterAction){
        switch to {
        case .openProduct(let product):
            let vc = ProductRouter.createProductModule(product: product)
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            view?.present(vc, animated: true, completion: nil)
        }
    }
}
