//
//  AppDelegate.swift
//  CakeFactory
//
//  Created by Mariluz Parejo on 26/11/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.showInitialViewController()
        
        return true
    }
    
    func showInitialViewController() {
        let cakeListVC = CakeListViewController(nibName: String(describing: CakeListViewController.self), bundle: nil)
        let navVC = UINavigationController(rootViewController: cakeListVC)
        navVC.modalPresentationStyle = .overFullScreen
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
   
}
