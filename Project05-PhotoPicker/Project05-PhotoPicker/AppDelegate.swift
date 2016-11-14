//
//  AppDelegate.swift
//  Project05-PhotoPicker
//
//  Created by VoidMagic on 2016/11/14.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        return true
    }
}

