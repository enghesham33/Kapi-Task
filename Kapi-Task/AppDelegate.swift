//
//  AppDelegate.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import UIKit
import Swinject
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let container = Container()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        AppDelegate.container.registerDependencies()
        startApplication()
        return true
    }

    func startApplication() {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        
        MainCoordinator.shared = MainCoordinator(navigationController: navController)
        MainCoordinator.shared?.push(destination: .PostsList)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}

