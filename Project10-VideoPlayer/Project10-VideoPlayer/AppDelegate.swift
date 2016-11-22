//
//  AppDelegate.swift
//  Project10-VideoPlayer
//
//  Created by VoidMagic on 2016/11/21.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
        
        return true
    }

}

