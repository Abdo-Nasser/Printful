//
//  ProductRouter.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit

class ProductRouter: ProductRouterProtocol {
    
    weak var view: UIViewController?
    
    static func createProductModule(product: Product) -> UIViewController{
        let view = ProductViewController()
        let viewModel = ProductViewModel(product: product) 
        let router = ProductRouter()
        let interactor = ProductInteractor()
        let presenter = ProductPresenter(view: view, interactor: interactor, router: router, viewModel: viewModel)
        
        view.presenter = presenter
        router.view = view
        return view
    }
    
    func go(to: ProductRouterAction){
        switch to {
        case .back:
            view?.dismiss(animated: true, completion: nil)
        }
    }
}
