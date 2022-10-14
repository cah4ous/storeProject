//
//  SearchViewController.swift
//  storeProjectDZ
//
//  Created by Александр Троицкий on 05.10.2022.
//

import UIKit

/// Экран поиска
final class SearchViewController: UIViewController {
    private enum Constants {
        static let search = "Поиск"
        static let magnifyingglass = "magnifyingglass"
        static let blackCase = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let iphoneInfo = "iPhone 12 Pro 128 GB тихоокеанский синий"
        static let watch = "Спортивный ремешок Black Unity"
        static let brownCase = "Кожаный чехол MacBook Pro, 16 дюймов"
        static let recently = "Недавно просмотренные"
        static let variants = "Варианты запросов"
        static let airpods = "AirPods"
        static let appleCare = "AppleCare"
        static let beats = "Beats"
        static let backButtonItem = "Поиск"
        static let compare = "Cравнение модели iPhone"
        static let clear = "Очистить"
        static let searchProduct = " Поиск по продуктам и магазинам"
        static let blackImagesNames = ["Image", "case2", "case3"]
        static let strapImagesNames = ["4", "clock2"]
        static let brownCaseImagesNames = ["2", "caseBrown2", "caseBrown3"]
        static let iphoneImageName = ["iphone12"]
        static let blackCasePrice = "3900"
        static let brownCasePrice = "4200"
        static let strapPrice = "8000"
        static let iPhonePrice = "123000"
        static let mainTextColor = "mainTextColor"
        static let searchColor = "searchaColor"
        static let tabColor = "tabColor"
        static let blackCaseUrlName = "https://re-store.ru/catalog/P058-109-15/"
        static let sportStrapUrlName = "https://re-store.ru/search/?q=Спортивный%20ремешок%20Black%20Unity"
        static let caseBrownUrlName = "https://re-store.ru/catalog/NM7MDT0M00/"
        static let iPhoneUrlName = "https://re-store.ru/catalog/MGDC3RU-A/"
        static let viewBackColor = "viewBackColor"
    }
    
    private let products = [
         Product(
             name: Constants.blackCase,
             imageNames: Constants.blackImagesNames,
             price: Constants.blackCasePrice,
             urlName: Constants.blackCaseUrlName
         ),
         Product(
            name: Constants.watch,
             imageNames: Constants.strapImagesNames,
             price: Constants.strapPrice,
             urlName: Constants.sportStrapUrlName
         ),
         Product(
             name: Constants.brownCase,
             imageNames: Constants.brownCaseImagesNames,
             price: Constants.brownCasePrice,
             urlName: Constants.caseBrownUrlName
         ),
         Product(
             name: Constants.iphoneInfo,
             imageNames: Constants.iphoneImageName,
             price: Constants.iPhonePrice,
             urlName: Constants.iPhoneUrlName
         )
     ]

    // MARK: - Private Visual Components
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.frame = CGRect(x: 5, y: 65, width: 140, height: 75)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.search
        
        return label
    }()
    
    private lazy var recentlyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 5, y: 185, width: 300, height: 75)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.recently
        
        return label
    }()
    
    private lazy var variantsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 5, y: 435, width: 300, height: 75)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.variants
        
        return label
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.clear, for: .normal)
        button.setTitleColor(UIColor(
            red: 4/255, green: 140/255, blue: 224/255, alpha: 1.0
        ), for: .normal)
        button.frame = CGRect(x: 300, y: 188, width: 100, height: 75)

        return button
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(named: Constants.searchColor)
        textField.attributedPlaceholder = NSAttributedString(
            string: Constants.searchProduct,
            attributes: [NSAttributedString.Key.foregroundColor:
                            UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
                        ]
        )
        
        let imageView = UIImageView(image: UIImage(systemName: Constants.magnifyingglass))
        imageView.tintColor = UIColor(named: Constants.searchColor)
        textField.leftView = imageView
        textField.leftViewMode = .always
        textField.backgroundColor = UIColor(named: Constants.tabColor)
        textField.frame = CGRect(x: 5, y: 135, width: 380, height: 40)
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    
    private lazy var scrollView: UIScrollView = {
        var myScrollView = UIScrollView()
        let scrollViewRect = CGRect(x: 0, y: 248, width: view.bounds.width, height: 204)
        
        myScrollView = UIScrollView(frame: scrollViewRect)
        myScrollView.isPagingEnabled = false
        myScrollView.showsHorizontalScrollIndicator = false
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width + 285, height: scrollViewRect.size.height)
        
        return myScrollView
    }()
    
    private let blackCaseView: UIView = {
         let blackView = UIView()
        blackView.backgroundColor = UIColor(named: Constants.tabColor)
        blackView.frame = CGRect(x: 5, y: 5, width: 150, height: 190)
        blackView.layer.cornerRadius = 10
        
        blackView.tag = 0
        return blackView
     }()
    
    private let brownCaseView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor(named: Constants.tabColor)
         view.frame = CGRect(x: 345, y: 5, width: 150, height: 190)
         view.layer.cornerRadius = 15
         view.tag = 2
        
         return view
     }()
    
    private let phoneCaseView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor(named: Constants.tabColor)
         view.frame = CGRect(x: 515, y: 5, width: 150, height: 190)
         view.layer.cornerRadius = 15
         view.tag = 3
        
         return view
     }()

     private let watchbandView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor(named: Constants.tabColor)
         view.frame = CGRect(x: 175, y: 5, width: 150, height: 190)
         view.layer.cornerRadius = 15
         view.tag = 1
         
         return view
     }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()

    }
    // MARK: - Private Objc Methods
    
    @objc private func handleTap(gest: UIGestureRecognizer) {
        let infoProductViewController = InfoProductViewController()
        guard let tag = gest.view?.tag else { return }
        infoProductViewController.product = products[tag]
        
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = Constants.backButtonItem
        navigationItem.backBarButtonItem = backButtonItem
        navigationController?.pushViewController(infoProductViewController, animated: false)
     }
    
    // MARK: - Private methods
    private func initMethods() {
        configureViews()
        
        createGrayLine(frame: CGRect(x: 5, y: 540, width: 385, height: 1))
        createGrayLine(frame: CGRect(x: 5, y: 590, width: 385, height: 1))
        createGrayLine(frame: CGRect(x: 5, y: 640, width: 385, height: 1))
        
        createMagnifyingGlassImageView(frame: CGRect(x: 5, y: 505, width: 23, height: 23))
        createMagnifyingGlassImageView(frame: CGRect(x: 5, y: 555, width: 23, height: 23))
        createMagnifyingGlassImageView(frame: CGRect(x: 5, y: 605, width: 23, height: 23))
        createMagnifyingGlassImageView(frame: CGRect(x: 5, y: 655, width: 23, height: 23))
        
        createProductText(text: Constants.airpods, frame: CGRect(x: 40, y: 490, width: 140, height: 50))
        createProductText(text: Constants.appleCare, frame: CGRect(x: 40, y: 540, width: 140, height: 50))
        createProductText(text: Constants.beats, frame: CGRect(x: 40, y: 590, width: 140, height: 50))
        createProductText(text: Constants.compare, frame: CGRect(x: 40, y: 640, width: 300, height: 50))
        
        createProduct(text: Constants.blackCase,
                     imageName: Constants.blackImagesNames[0],
                     frameOfSecondImage: CGRect(x: 23, y: 30, width: 100, height: 100),
                     tag: 0, frameOfLabel: CGRect(x: 13, y: 120, width: 130, height: 80),
                      newView: blackCaseView
        )
        createProduct(text: Constants.watch,
                      imageName: Constants.strapImagesNames[0],
                      frameOfSecondImage: CGRect(x: 23, y: 30, width: 100, height: 100),
                      tag: 1, frameOfLabel: CGRect(x: 13, y: 120, width: 130, height: 80),
                      newView: watchbandView
        )
        createProduct(text: Constants.brownCase,
                      imageName: Constants.brownCaseImagesNames[0],
                      frameOfSecondImage: CGRect(x: 23, y: 30, width: 100, height: 100),
                      tag: 2, frameOfLabel: CGRect(x: 13, y: 120, width: 130, height: 80),
                      newView: brownCaseView
        )
        createProduct(text: Constants.iphoneInfo,
                      imageName: Constants.iphoneImageName[0],
                      frameOfSecondImage: CGRect(x: 23, y: 30, width: 100, height: 100),
                      tag: 3, frameOfLabel: CGRect(x: 13, y: 120, width: 130, height: 80),
                      newView: phoneCaseView
        )
    }
    
    private func createMagnifyingGlassImageView(frame: CGRect) {
        let imageView = UIImageView(image: UIImage(systemName: Constants.magnifyingglass))
        imageView.tintColor = UIColor(named: Constants.searchColor)
        imageView.frame = frame
        
        view.addSubview(imageView)
    }
    
    private func createProduct(text: String, imageName: String, frameOfSecondImage: CGRect,
                               tag: Int, frameOfLabel: CGRect, newView: UIView
    ) {
        let imageView = UIImageView()
        let productImage = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.image = productImage
        imageView.frame = frameOfSecondImage
        imageView.tag = tag
    
        let label = UILabel()
        label.frame = frameOfLabel
        label.text = text
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = UIColor(named: Constants.mainTextColor)

        newView.addSubview(label)
        newView.addSubview(imageView)

        newView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        view.addSubview(newView)
        scrollView.addSubview(newView)
    }
    
    private func createGrayLine(frame: CGRect) {
        let lineView = UIView()
        lineView.frame = frame
        lineView.setUnderLine()
        
        view.addSubview(lineView)
    }
    
    private func createProductText(text: String, frame: CGRect) {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.frame = frame
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = text

        view.addSubview(label)
    }
    
    private func configureViews() {
        view.addSubview(searchLabel)
        view.addSubview(searchTextField)
        view.addSubview(recentlyLabel)
        view.addSubview(clearButton)
        view.addSubview(variantsLabel)
        view.addSubview(scrollView)
        
        view.backgroundColor = UIColor(named: Constants.viewBackColor)
    }
}
/// Вьюшка серой линии
extension UIView {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(named: "tabColor")?.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,
                              width: self.frame.size.width - 10,
                              height: self.frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}
