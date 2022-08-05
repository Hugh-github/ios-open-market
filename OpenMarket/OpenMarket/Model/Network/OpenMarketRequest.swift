//
//  OpenMarketRequest.swift
//  OpenMarket
//
//  Created by Kiwon Song on 2022/08/04.
//

import Foundation

protocol OpenMarketRequest {
}

extension OpenMarketRequest {
    func generateBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    func createDataBody(withParameters params: ProductRegistration, images: [ImageFile]?, boundary: String) -> Data? {
        guard let jsonData = try? JSONEncoder().encode(params) else {
            return nil
        }
        
        var body = Data()
        
        body.append("\r\n--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"params\"\r\n")
        body.append("Content-Type: application/json\r\n")
        body.append("\r\n")
        body.append(jsonData)
        body.append("\r\n")
        
        if let images = images {
            for image in images {
                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"images\"; filename=\"\(image.fileName)\"\r\n")
                body.append("Content-Type: image/\(image.type)\r\n")
                body.append("\r\n")
                body.append(image.data)
                body.append("\r\n")
            }
        }
        
        body.append("\r\n--\(boundary)--\r\n")
        
        return body
    }
}

