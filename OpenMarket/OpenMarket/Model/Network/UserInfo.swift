//
//  UserInfo.swift
//  OpenMarket
//
//  Created by Kiwon Song on 2022/08/03.
//

import UIKit

enum UserInfo: CustomStringConvertible {
    case Identifier
    case secret
    
    var description: String {
        switch self {
        case .Identifier:
            return "db9ad21f-0335-11ed-9676-d981f203510d"
        case .secret:
            return "MDiJmFcA7K"
        }
    }
}


