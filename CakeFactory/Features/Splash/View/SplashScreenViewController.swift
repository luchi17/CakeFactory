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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        showCakeList()
        
    }
    
    private func configureUI() {
        self.contentView.backgroundColor = UIColor(red: 246/257, green: 165/257, blue: 236/257, alpha: 1.0)
        self.titleLabel.text = "Cake Factory"
        self.titleLabel.textColor = .white
        
    }
    
    private func showCakeList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
            let cakeListVC = CakeListViewController(nibName: String(describing: CakeListViewController.self), bundle: nil)
            let navVC = UINavigationController(rootViewController: cakeListVC)
            navVC.modalPresentationStyle = .overFullScreen
            DispatchQueue.main.async {
                self.present(navVC, animated: false, completion: nil)
            }
        }
        
    }
}

protocol SplashScreenViewModelToCoordinatorProtocol {
    func showCakeList()
}
