//
//  SceneDelegate.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/07/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowSecne = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowSecne)
        let vc = DispatchQueueViewController()
        
        
        //Rating
        // NavigationController
//        let homeVC = RatingViewController()
//        homeVC.navigationItem.title = "Players"
//        let navVC = UINavigationController(rootViewController: homeVC)
//
//        // TabBarController
//        let tabBarController = UITabBarController()
//        let gestureVC = GestureViewController()
//        tabBarController.viewControllers = [navVC, gestureVC]
//
//        navVC.tabBarItem = UITabBarItem(title: "Player", image: UIImage(systemName: "camera"), tag: 0)
//        gestureVC.tabBarItem = UITabBarItem(title: "Gesture", image: UIImage(systemName: "flag.2.crossed.fill"), tag: 1)
//        window?.rootViewController = tabBarController
        
        //Component-Starter
        // Navigation
//        window?.rootViewController = UINavigationController(rootViewController: ComponentViewController())
        
        window?.rootViewController = vc
        
        window?.backgroundColor = .systemBackground
        // 윈도우가 여러개일 때 이 윈도우를 Key Window로 만들겠다
        window?.makeKeyAndVisible()
    }
}

