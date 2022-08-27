//
//  AppDelegate.swift
//  CoreDataHW
//
//  Created by Виталий Таран on 18.08.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.navigationBar.tintColor = .black
//        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }


   

}
