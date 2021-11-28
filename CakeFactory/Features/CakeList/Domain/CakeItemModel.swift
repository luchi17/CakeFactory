//
//  CakeItemModel.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 27/11/21.
//

import Foundation
import UIKit

struct CakeItemModel: Equatable, Hashable {
    
    static func == (lhs: CakeItemModel, rhs: CakeItemModel) -> Bool {
        return lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.imageUrlString == rhs.imageUrlString
    }
    
    var title: String
    var description: String
    var imageUrlString: String
    
}
