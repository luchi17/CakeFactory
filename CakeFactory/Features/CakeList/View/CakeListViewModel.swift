//
//  CakeListViewModel.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 27/11/21.
//

import Foundation

class CakeListViewModel: NSObject {
    
    private var cakeData: CakeListModel? {
        didSet {
            self.bindCakeListModel(cakeData)
        }
    }
    
    var bindCakeListModel : ((CakeListModel?) -> ()) = { response in }
}

extension CakeListViewModel: CakeListInterfaceToViewModelProtocol {
    func loadCakeList() {
        
    }
}


protocol CakeListInterfaceToViewModelProtocol {
    func loadCakeList()
    var bindCakeListModel: ((CakeListModel?) -> ()) { get set }
}
