//
//  AppDelegate.swift
//  Project03-CustomFonts
//
//  Created by 王迁 on 2016/11/12.
//  Copyright © 2016年 王迁. All rights reserved.
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

