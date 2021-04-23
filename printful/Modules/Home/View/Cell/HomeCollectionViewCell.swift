//
//  HomeCollectionViewCell.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    //OutLets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(product: Product){
        productNameLabel.text = product.title
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "\(product.price) $"
        if let url = URL(string: product.image) {
            productImageView.loadImage(url: url, placeholder: UIImage(named: "default-image"))
        }
        self.contentView.setBorder(cornerRadius: 5, width: 1, color: .gray)
    }
}
