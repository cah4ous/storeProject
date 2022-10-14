//
//  ViewController.swift
//  storeProjectDZ
//
//  Created by Александр Троицкий on 05.10.2022.
//

import UIKit
/// Экран для покупок
final class BuyViewController: UIViewController {
     private enum Constants {
         static let isWatchedPresentation = "viewed"
     }

     // MARK: - Lifecycle
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         startBeginPresent()
     }

     // MARK: - Private methods
     private func startBeginPresent() {
         let userDefaults = UserDefaults.standard
         let presentationWasViewed = userDefaults.bool(forKey: Constants.isWatchedPresentation)
         if presentationWasViewed == false {
             let pageViewController = PageViewController(transitionStyle: .scroll,
                 navigationOrientation: .horizontal, options: nil)
             present(pageViewController, animated: true, completion: nil)
         }
     }
}
