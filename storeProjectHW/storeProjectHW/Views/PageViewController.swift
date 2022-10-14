//
//  PageViewController.swift
//  storeProjectHW
//
//  Created by Александр Троицкий on 14.10.2022.
//

import UIKit

protocol OnboardingBusinessLogicDelegate: NSObjectProtocol {
    func goForward(index: Int)
}

/// Переключает экраны начальной презентации
final class PageViewController: UIPageViewController {
    private enum Constants {
        static let pageTitleOne = "Track Your Cycle"
        static let pageTitleTwo = "Plan Your Pregnancy"
        static let pageTitleThree = "Daily Health Inside"
        static let pageInfoOne = "Manage irregular period and learn how to improve your period"
        static let pageInfoTwo = "Favorable days are important. Vestibulum rutrum quam vitae fringila tincidunt"
        static let pageInfoThree =
        "Personal health inside. Vestibulum rutrum quam vitae fringila tincidunt"
        static let firstImageName = "page1"
        static let secondImageName = "page2"
        static let thirdImageName = "page3"
        static let watchedPresentation = "viewed"
    
    }
    
    // MARK: - Public property
    var newIndex = 0

    // MARK: - Private property
    private let titles = [Constants.pageTitleOne, Constants.pageTitleTwo, Constants.pageTitleThree]
    private let descriptions = [Constants.pageInfoOne, Constants.pageInfoTwo,
                              Constants.pageInfoThree]
    private let images = [Constants.firstImageName, Constants.secondImageName, Constants.thirdImageName]
    private var pageControl =  UIPageControl.appearance()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }

    // MARK: - Private methods
    private func initMethods() {
        settingView()
        initPresentation()
    }
    
    private func settingView() {
        view.backgroundColor = .white
    }
    
    private func initPresentation() {
        dataSource = self
        
        if let contentViewController = presentViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .systemBlue
    }

    private func presentViewControllerAtIndex(_ index: Int) -> StoreViewController? {
        guard index >= 0 else { return nil }
        
        if index < titles.count {
            let storeViewController = StoreViewController()

            storeViewController.presentText = titles[index]
            storeViewController.textDescription = descriptions[index]
            storeViewController.currentPage = index
            storeViewController.pagesNumber = titles.count
            storeViewController.imageText = images[index]
            storeViewController.delegate = self

            return storeViewController
            
        } else {
            UserDefaults.standard.set(true, forKey: Constants.watchedPresentation)
            return nil}

    }
}

/// protocolPageViewController
extension PageViewController: OnboardingBusinessLogicDelegate {
    func goForward(index: Int) {
        newIndex = index
        guard let currentPage = viewControllers?.first,
              let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage)
        else { return }
        setViewControllers([nextPage], direction: .forward, animated: true)
    }
}

/// UIPageViewControllerDataSource, UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if newIndex > 0 {
            newIndex -= 1
            return presentViewControllerAtIndex(newIndex)
        } else {
            return presentViewControllerAtIndex(newIndex)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if newIndex != 2 {
            newIndex += 1
            return presentViewControllerAtIndex(newIndex)
        } else {
            return nil
        }
    }
}
