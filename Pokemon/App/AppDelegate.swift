//
//  AppDelegate.swift
//  Pokemon
//
//  Created by Maxim on 10.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.blue
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        return true
    }
}
