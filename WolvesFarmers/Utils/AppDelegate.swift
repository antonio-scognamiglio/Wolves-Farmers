//
//  AppDelegate.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 16/01/23.
//

import UIKit
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
        application.beginBackgroundTask(withName: "showNotification", expirationHandler: nil)
        return true
    }
    
}
