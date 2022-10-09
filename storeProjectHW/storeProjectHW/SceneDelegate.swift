//
//  SceneDelegate.swift
//  storeProjectDZ
//
//  Created by Александр Троицкий on 05.10.2022.
//

import UIKit
/// 
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private enum Constants {
        static let laptopAndPhoneImageName = "laptopcomputer.and.iphone"
        static let laptopAndPhoneTitle = "Купить"
        static let personImageName = "person.circle"
        static let personTitle = "Для вас"
        static let searchTitle = "Поиск"
        static let searchImageName = "magnifyingglass"
        static let backetImageName = "bag"
        static let backetTitle = "Корзина"
        static let unselectedTabBar = "unselectedTabBar"
        static let tabColor = "tabColor"
    }

    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
         guard let scene = (scene as? UIWindowScene) else { return }
         window = UIWindow(windowScene: scene)

         let tabBar = UITabBarController()

         let buyViewController = UINavigationController(rootViewController: BuyViewController())
         let personViewController = UINavigationController(rootViewController: PersonViewController())
         let searchViewController = UINavigationController(rootViewController: SearchViewController())
         let backetViewContoller = UINavigationController(rootViewController: BasketViewController())

        createTabBarItem(viewController: buyViewController,
                         title: Constants.laptopAndPhoneTitle,
                         nameImage: Constants.laptopAndPhoneImageName,
                         tag: 0
        )
        
        createTabBarItem(viewController: personViewController,
                         title: Constants.personTitle,
                         nameImage: Constants.personImageName,
                         tag: 1
        )
        
        createTabBarItem(viewController: searchViewController,
                         title: Constants.searchTitle,
                         nameImage: Constants.searchImageName,
                         tag: 3
        )
        
        createTabBarItem(viewController: backetViewContoller,
                         title: Constants.backetTitle,
                         nameImage: Constants.backetImageName,
                         tag: 4
        )

         tabBar.setViewControllers(
             [buyViewController, personViewController, searchViewController, backetViewContoller],
             animated: false
         )

        tabBar.tabBar.unselectedItemTintColor = UIColor(named: Constants.unselectedTabBar)
        tabBar.tabBar.backgroundColor = UIColor(named: Constants.tabColor)

         window?.rootViewController = tabBar
         window?.makeKeyAndVisible()
    }
    
    func createTabBarItem(viewController: UIViewController, title: String, nameImage: String, tag: Int) {
        viewController.tabBarItem = UITabBarItem(
            title: title, image: UIImage(systemName: nameImage,
                                             withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), tag: tag
        )
    }
}
