//
//  SceneDelegate.swift
//  storeProjectDZ
//
//  Created by Александр Троицкий on 05.10.2022.
//

import UIKit
/// 
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let tabBar = UITabBarController()
        
        let buyViewController = BuyViewController()
        let personViewController = PersonViewController()
        let searchViewController = SearchViewController()
        let backetViewContoller = BasketViewController()
        
        buyViewController.tabBarItem = UITabBarItem(
            title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone",
                                            withConfiguration: UIImage.SymbolConfiguration(weight: .light)), tag: 0
        )
        personViewController.tabBarItem = UITabBarItem(
            title: "Для вас", image: UIImage(systemName: "person.circle",
                                             withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), tag: 1
        )
        searchViewController.tabBarItem = UITabBarItem(
            title: "Поиск", image: UIImage(systemName: "magnifyingglass",
                                           withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), tag: 3
        )
        backetViewContoller.tabBarItem = UITabBarItem(
            title: "Корзина", image: UIImage(systemName: "bag",
                                             withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), tag: 4
        )
        
        tabBar.setViewControllers(
            [buyViewController, personViewController, searchViewController, backetViewContoller],
            animated: false
        )
        
        tabBar.tabBar.unselectedItemTintColor = .gray
        tabBar.tabBar.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.00)
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}
