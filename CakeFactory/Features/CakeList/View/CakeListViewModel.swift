//
//  CakeListViewModel.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 27/11/21.
//

import Foundation

class CakeListViewModel: NSObject {
    
    private var cakeListManager: CakeListManagerProtocol
    private var cakeListModel: CakeListModel? {
        didSet {
            self.bindCakeListModel(cakeListModel)
        }
    }
    
    var bindCakeListModel : ((CakeListModel?) -> ()) = { response in }
    var bindServiceError : ((Error) -> ()) = { error in }
    
    init(cakeListManager: CakeListManagerProtocol) {
        self.cakeListManager = cakeListManager
    }
}

extension CakeListViewModel: CakeListInterfaceToViewModelProtocol {
    func loadCakeList() {
        cakeListManager.getCakeListData { cakeListModel in
            self.cakeListModel = cakeListModel
        } onError: { error in
            if let error = error {
                self.bindServiceError(error)
            }
        }

    }
}


protocol CakeListInterfaceToViewModelProtocol {
    func loadCakeList()
    var bindCakeListModel: ((CakeListModel?) -> ()) { get set }
    var bindServiceError : ((Error) -> ()) { get set }
}
