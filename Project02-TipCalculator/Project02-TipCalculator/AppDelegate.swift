//
//  AppDelegate.swift
//  Project02-TipCalculator
//
//  Created by VoidMagic on 2016/11/11.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        return true
    }
    
    
    
}

