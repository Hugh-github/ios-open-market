//
//  ProductRegistration.swift
//  OpenMarket
//
//  Created by Kiwon Song on 2022/08/04.
//

import Foundation

struct ProductRegistration: Encodable {
    let name: String
    let descriptions: String
    let price: Double
    let currency: String
    let discountedPrice: Double?
    let stock: Int?
    let secret: String
    
    enum CodingKeys: String, CodingKey {
        case name, descriptions, price, currency, stock, secret
        case discountedPrice = "discounted_price"
    }
}

struct ImageFile {
  let fileName: String
  let type: String = "jpeg"
  let data: Data
}
