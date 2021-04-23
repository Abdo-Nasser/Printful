//
//  Product.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import Foundation

struct Product: Codable {
    var id: Int = 0
    var title: String = ""
    var price: Float = 0
    var category: String = ""
    var description: String = ""
    var image: String = ""
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case title = "title"
        case price = "price"
        case category = "category"
        case description = "description"
        case image = "image"
    }
}
