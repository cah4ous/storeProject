//
//  SearchViewController.swift
//  storeProjectDZ
//
//  Created by Александр Троицкий on 05.10.2022.
//

import UIKit
/// Экран поиска
final class SearchViewController: UIViewController {

    // MARK: Private IBOutlet
    private lazy var searchLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.frame = CGRect(x: 5, y: 80, width: 140, height: 75)
        label.textColor = .white
        label.text = "Поиск"
        
        return label
    }()
    
    private lazy var firstSearchImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.tintColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        imageView.frame = CGRect(x: 5, y: 505, width: 23, height: 23)
        
        return imageView
    }()
    
    private lazy var caseImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "Image"))
        imageView.frame = CGRect(x: 20, y: 290, width: 100, height: 75)
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(imageTappedAction(tapGestureRecognizer:))
        )
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return imageView
    }()
    
    private lazy var caseLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 12, y: 358, width: 120, height: 90)
        label.text = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var grayImage: UIImageView = {
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 5, y: 275, width: 130, height: 160)
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(imageTappedAction(tapGestureRecognizer:))
        )
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private lazy var grayImageTwo: UIImageView = {
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 160, y: 275, width: 130, height: 160)
        imageView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private lazy var grayImageThree: UIImageView = {
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 315, y: 275, width: 130, height: 160)
        imageView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private lazy var strapImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "4"))
        imageView.frame = CGRect(x: 178, y: 280, width: 100, height: 90)
        
        return imageView
    }()
    
    private lazy var brownCaseImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "2"))
        imageView.frame = CGRect(x: 330, y: 294, width: 100, height: 90)
        
        return imageView
    }()
    
    private lazy var brownCaseLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 320, y: 353, width: 120, height: 100)
        label.text = "Кожаный чехол MacBook Pro, 16 дюймов"
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var watchLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 168, y: 353, width: 120, height: 100)
        label.text = "Спортивный ремешок Black Unity"
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var secondSearchImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.tintColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        imageView.frame = CGRect(x: 5, y: 545, width: 23, height: 23)
        
        return imageView
    }()
    
    private lazy var thirdSearchImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.tintColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        imageView.frame = CGRect(x: 5, y: 585, width: 23, height: 23)
        
        return imageView
    }()
    
    private lazy var forthSearchImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.tintColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        imageView.frame = CGRect(x: 5, y: 625, width: 23, height: 23)
        
        return imageView
    }()
    
    private lazy var recentlyLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 5, y: 200, width: 300, height: 75)
        label.textColor = .white
        label.text = "Недавно просмотренные"
        
        return label
    }()
    
    private lazy var variantsLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 5, y: 435, width: 300, height: 75)
        label.textColor = .white
        label.text = "Варианты запросов"
        
        return label
    }()
    
    private lazy var airPodsLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 40, y: 490, width: 140, height: 50)
        label.textColor = .white
        label.text = "AirPods"
        
        return label
    }()
    
    private lazy var appleCareLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 40, y: 530, width: 140, height: 50)
        label.textColor = .white
        label.text = "AppleCare"
        
        return label
    }()
    
    private lazy var beatsLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 40, y: 570, width: 140, height: 50)
        label.textColor = .white
        label.text = "Beats"
        
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 40, y: 610, width: 250, height: 50)
        label.textColor = .white
        label.text = "Сравнение модели iPhone"
        
        return label
    }()
    
    private lazy var clearButton: UIButton = {
        var button = UIButton()
        button.setTitle("Очистить", for: .normal)
        button.setTitleColor(UIColor(
            red: 4/255, green: 140/255, blue: 224/255, alpha: 1.0
        ), for: .normal)
        button.frame = CGRect(x: 300, y: 203, width: 100, height: 75)

        return button
    }()
    
    private lazy var searchTextField: UITextField = {
        var textField = UITextField()
        textField.textColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        textField.attributedPlaceholder = NSAttributedString(
            string: " Поиск по продуктам и магазинам",
            attributes: [NSAttributedString.Key.foregroundColor:
                            UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
                        ]
        )
        var imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.tintColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        textField.leftView = imageView
        textField.leftViewMode = .always
        textField.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
        textField.frame = CGRect(x: 5, y: 150, width: 380, height: 40)
        textField.layer.cornerRadius = 10
        
        return textField
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()

    }
    
    // MARK: - Private IBAction
    @objc private func imageTappedAction(tapGestureRecognizer: UITapGestureRecognizer) {
        let basketViewController = BasketViewController()
        basketViewController.modalPresentationStyle = .fullScreen
        tabBarController?.present(basketViewController, animated: true)
     }
    
    // MARK: - Private Methods
    private func initMethods() {
        configureViews()
    }
    
    private func configureViews() {
        view.addSubview(searchLabel)
        view.addSubview(searchTextField)
        view.addSubview(recentlyLabel)
        view.addSubview(clearButton)
        view.addSubview(variantsLabel)
        view.addSubview(airPodsLabel)
        view.addSubview(beatsLabel)
        view.addSubview(phoneLabel)
        view.addSubview(appleCareLabel)
        view.addSubview(firstSearchImage)
        view.addSubview(secondSearchImage)
        view.addSubview(thirdSearchImage)
        view.addSubview(forthSearchImage)
        view.addSubview(grayImage)
        view.addSubview(caseImage)
        view.addSubview(grayImageTwo)
        view.addSubview(strapImage)
        view.addSubview(caseLabel)
        view.addSubview(watchLabel)
        view.addSubview(grayImageThree)
        view.addSubview(brownCaseImage)
        view.addSubview(brownCaseLabel)
        
        view.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
    }
}
