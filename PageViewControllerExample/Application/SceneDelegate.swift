//
//  SceneDelegate.swift
//  PageViewControllerExample
//
//  Created by Jaewon on 2022/10/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow.init(windowScene: windowScene)
        
        let alphaStoryboard = UIStoryboard.init(name: "Alpha", bundle: nil)
        let alphaVC = alphaStoryboard.instantiateViewController(withIdentifier: "AlphaViewController")
        
        let alphaTabBarItem = UITabBarItem.init(
            title: "Alpha",
            image: UIImage.init(systemName: "a.square"),
            selectedImage: UIImage.init(systemName: "a.square.fill")
        )
        alphaVC.tabBarItem = alphaTabBarItem
        
        
        let betaVC = BetaViewController.init()
        
        let betaTabBarItem = UITabBarItem.init(
            title: "Beta",
            image: UIImage.init(systemName: "b.square"),
            selectedImage: UIImage.init(systemName: "b.square.fill")
        )
        betaVC.tabBarItem = betaTabBarItem
        
        let tabBarController = UITabBarController.init()
        tabBarController.viewControllers = [alphaVC, betaVC]
        tabBarController.tabBar.backgroundColor = .systemGray6
        
        
        window?.rootViewController = tabBarController
        
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

