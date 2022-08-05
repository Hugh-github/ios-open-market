//
//  ProductImage.swift
//  OpenMarket
//
//  Created by Kiwon Song on 2022/08/04.
//

struct ProductImage: Codable {
    let id: Int
    let url: String
    let thumbnailURL: String
    let succeed: Bool
    let issuedAt: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case thumbnailURL = "thrumbnail_url"
        case succeed
        case issuedAt = "issued_at"
    }
}
