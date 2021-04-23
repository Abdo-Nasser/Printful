//
//  ProductPresenter.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Foundation

class ProductPresenter: ProductPresenterProtocol {
    
    var view: ProductViewControllerProtocol?
    var interactor:  ProductInteractorProtocol
    var router:  ProductRouterProtocol
    var viewModel:  ProductViewModel
    
    init(view:  ProductViewControllerProtocol,
         interactor:  ProductInteractorProtocol,
         router:  ProductRouterProtocol,
         viewModel:  ProductViewModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.viewModel = viewModel
    }
    
    func attach(){
    }
    
    func back(){
        router.go(to: .back)
    }
}
