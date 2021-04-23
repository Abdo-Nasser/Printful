//
//  AppDelegate.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = HomeRouter.createHomeModule()
        window?.makeKeyAndVisible()
        return true
    }
}

