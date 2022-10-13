//
//  MainTabBarController.swift
//  storeProjectHW
//
//  Created by Александр Троицкий on 11.10.2022.
//

import UIKit
/// Настройка таббара
final class MainTabBarViewController: UITabBarController {

    private enum Constants {
        static let laptopAndPhoneTitle = "Купить"
        static let personTitle = "Для вас"
        static let backetTitle = "Корзина"
        static let searchTitle = "Поиск"
        static let personImageName = "person.circle"
        static let searchImageName = "magnifyingglass"
        static let backetImageName = "bag"
        static let laptopAndPhoneImageName = "laptopcomputer.and.iphone"
        static let unselectedTabBar = "unselectedTabBar"
        static let tabColor = "tabColor"
    }
    // MARK: - Private properties
      private let searchViewController = SearchViewController()
      private let searchTabBarItem = UITabBarItem(
          title: Constants.searchTitle,
          image: UIImage(systemName: Constants.searchImageName),
          tag: 0
      )
      private let buyViewController = BuyViewController()
      private let buyTabBarItem = UITabBarItem(
          title: Constants.laptopAndPhoneTitle,
          image: UIImage(systemName: Constants.laptopAndPhoneImageName),
          tag: 1
      )
      private let personViewController = UINavigationController(rootViewController: PersonViewController())
      private let personTabBarItem = UITabBarItem(
        title: Constants.personTitle,
        image: UIImage(systemName: Constants.personImageName),
          tag: 2
      )
      private let basketViewController = BasketViewController()
      private let basketTabBarItem = UITabBarItem(
        title: Constants.backetTitle,
        image: UIImage(systemName: Constants.backetImageName),
          tag: 3
      )

      // MARK: - Lifecycle
      override func viewDidLoad() {
          super.viewDidLoad()
          setupUI()
      }

      // MARK: - Private methods
      private func setupUI() {
          let navigationController = UINavigationController(rootViewController: searchViewController)
          viewControllers = [buyViewController, personViewController, navigationController, basketViewController]
          buyViewController.tabBarItem = buyTabBarItem
          personViewController.tabBarItem = personTabBarItem
          searchViewController.tabBarItem = searchTabBarItem
          basketViewController.tabBarItem = basketTabBarItem
          tabBar.backgroundColor = .systemGray6
          
      }
  }
