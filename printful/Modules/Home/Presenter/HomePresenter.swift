//
//  HomePresenter.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewControllerProtocol?
    var interactor:  HomeInteractorProtocol
    var router:  HomeRouterProtocol
    var viewModel:  HomeViewModel
    
    init(view:  HomeViewControllerProtocol,
         interactor:  HomeInteractorProtocol,
         router:  HomeRouterProtocol,
         viewModel:  HomeViewModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.viewModel = viewModel
    }
    
    func attach(){
        getListOfUser()
    }
    
    private func getListOfUser(){
        view?.showLoading(true)
        interactor.getListOfProducts { [weak self] result in 
            switch result {
            case .success(let data):
                self?.viewModel.listOfProducts = data 
                self?.view?.UpdateUI()
            case .failure(let error):
                print("Get List Of Products With error: \(error)")
            }
            self?.view?.showLoading(false)
        }
    }
    
    func openProduct(_ product: Product){
        router.go(to: .openProduct(Product: product))
    }
}
