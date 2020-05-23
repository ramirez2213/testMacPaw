//
//  AppDelegate.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 08.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
}

