//
//  CakeListManager.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 28/11/21.
//

import UIKit

class CakeListManager: NSObject, CakeListManagerProtocol {
    
    private var dataSource: CakeListDataSourceProtocol
    init(dataSource: CakeListDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getCakeListData(completion: @escaping (CakeListModel?) -> ()) {
        self.dataSource.getCakeListData { items in
            
            if let items = items {
                var cakeItems: [CakeItemModel] = []
            
                for itemDataOut in items {
                    let cakeItem = CakeItemModel(title: itemDataOut.title,
                                                 description: itemDataOut.desc,
                                                 imageUrlString: itemDataOut.image)
                    cakeItems.append(cakeItem)
                }
                
                let cakeListModel = CakeListModel(items: cakeItems)
                completion(cakeListModel)
            } else {
                completion(nil)
            }
        }
    }
}

protocol CakeListManagerProtocol {
    func getCakeListData(completion: @escaping (CakeListModel?) -> ())
}
