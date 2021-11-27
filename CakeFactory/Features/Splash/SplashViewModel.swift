//
//  SplashViewModel.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 26/11/21.
//

import Foundation


class SplashScreenViewModel: NSObject {
    
}


extension SplashScreenViewModel: SplashScreenInterfaceToViewModelProtocol {
    
    func showCakeList() {
        
        
    }
}

protocol SplashScreenInterfaceToViewModelProtocol {
    func showCakeList()
}
