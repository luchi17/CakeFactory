//
//  CakeListViewModel.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 27/11/21.
//

import Foundation

class CakeListViewModel: NSObject {
    
    private var cakeListManager: CakeListManagerProtocol
    private var cakeData: CakeListModel? {
        didSet {
            self.bindCakeListModel(cakeData)
        }
    }
    
    var bindCakeListModel : ((CakeListModel?) -> ()) = { response in }
    
    init(cakeListManager: CakeListManagerProtocol) {
        self.cakeListManager = cakeListManager
    }
}

extension CakeListViewModel: CakeListInterfaceToViewModelProtocol {
    func loadCakeList() {
        cakeListManager.getCakeListData { cakeModel in
            self.cakeData = cakeModel
        }
    }
}


protocol CakeListInterfaceToViewModelProtocol {
    func loadCakeList()
    var bindCakeListModel: ((CakeListModel?) -> ()) { get set }
}
