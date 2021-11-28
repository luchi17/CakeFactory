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
    
    func getCakeListData(onSuccess: @escaping (CakeListModel) -> (), onError: @escaping (Error?) -> ()) {
        self.dataSource.getCakeListData { itemsDataOut in
            if let itemsDataOut = itemsDataOut {
                var cakeItems: [CakeItemModel] = []
            
                for itemDataOut in itemsDataOut {
                    let cakeItem = CakeItemModel(title: itemDataOut.title,
                                                 description: itemDataOut.desc,
                                                 imageUrlString: itemDataOut.image)
                    cakeItems.append(cakeItem)
                }
                
                let cakeListModel = CakeListModel(items: cakeItems)
                onSuccess(cakeListModel)
            } else {
                onError(nil)
            }
            
        } onError: { error in
            onError(error)
        }

    }
}

protocol CakeListManagerProtocol {
    func getCakeListData(onSuccess: @escaping (CakeListModel) -> (), onError: @escaping (Error?) -> ())
}
