//
//  SplashViewController.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 26/11/21.
//

import Foundation
import UIKit


class SplashScreenViewController: UIViewController {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var viewModel = SplashScreenViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.contentView.backgroundColor = UIColor(red: 246/257, green: 165/257, blue: 236/257, alpha: 1.0)
        self.titleLabel.text = "Cake Factory"
        self.titleLabel.textColor = .white
        
        viewModel.showCakeList()
       
    }
}

protocol SplashScreenViewModelToCoordinatorProtocol {
    func showCakeList()
}
