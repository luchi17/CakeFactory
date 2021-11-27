//
//  SplashViewController.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 26/11/21.
//

import Foundation
import UIKit


class SplashScreenViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var viewModel = SplashScreenViewModel()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(named: "F6A5EC")
        self.titleLabel.text = "Cake Factory"
        self.titleLabel.textColor = .white
        
        viewModel.showCakeList()
       
    }
}

protocol SplashScreenViewModelToCoordinatorProtocol {
    func showCakeList()
}
