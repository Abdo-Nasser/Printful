//
//  ProductViewController.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit

class ProductViewController: UIViewController {
    //Attributes
    var presenter: ProductPresenterProtocol?

    //OutLets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        let product = presenter?.viewModel.product ?? Product()
        productNameLabel.text = product.title
        productPriceLabel.text = "\(product.price) $"
        productDescriptionLabel.text = product.description
        if let url = URL(string: product.image){
         productImageView.loadImage(url: url, placeholder: #imageLiteral(resourceName: "default-image"))
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        presenter?.back()
    }
}

extension ProductViewController: ProductViewControllerProtocol{   
}
