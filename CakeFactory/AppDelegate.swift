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
        
        self.showSplashViewController()
        
        return true
    }
    
    func showSplashViewController() {
        if let window = self.window {
            let storyboard = UIStoryboard(name: "SplashScreen", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "SplashScreenViewControllerId") as! SplashScreenViewController
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }
    }
   
}
