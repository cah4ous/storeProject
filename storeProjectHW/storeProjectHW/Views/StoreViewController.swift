//
//  StoreViewController.swift
//  storeProjectHW
//
//  Created by Александр Троицкий on 14.10.2022.
//

import UIKit

///  Экран отображает данные страниц пейдж контроллера
final class StoreViewController: UIViewController {
    private enum Constants {
        static let titleFont = "Cochin-Bold"
        static let textFont = "Georgia"
        static let skipText = "SKIP"
        static let nextText = "NEXT"
        static let startedText = "GET STARTED!"
        static let emptyText = ""
        static let defaultsKey = "presentationWasViewed"
    }

    // MARK: - Private Visual Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 550, width: view.bounds.width / 2, height: 75)
        label.textColor = .black
        label.font = UIFont(name: Constants.titleFont, size: 25)
        label.textAlignment = .center
        
        return label
    }()

    private lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 550, width: view.bounds.width - 40, height: 200)
        label.font = UIFont(name: Constants.textFont, size: 16)
        label.textColor = .systemGray4
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()

    private lazy var pageControl: UIPageControl = { 
        let control = UIPageControl()
        control.contentHorizontalAlignment = .center
        control.frame = CGRect(x: 0, y: view.bounds.height - 130, width: view.bounds.width, height: 35)
        
        return control
    }()

    private lazy var mainPageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        imageView.backgroundColor = .red
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()

    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.gray, for: .normal)
        button.setTitle(Constants.skipText, for: .normal)
        button.frame = CGRect(x: 30, y: view.bounds.height - 128, width: 100, height: 30)
        button.addTarget(self, action: #selector(goSkipAction), for: .touchUpInside)
        
        return button
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.setTitle(Constants.nextText, for: .normal)
        button.frame = CGRect(x: view.bounds.width - 120, y: view.bounds.height - 128, width: 100, height: 30)
        button.addTarget(self, action: #selector(goForwardAction), for: .allEvents)
        
        return button
    }()

    private lazy var startedButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.setTitle(Constants.startedText, for: .normal)
        button.frame = CGRect(x: 110, y: view.bounds.height - 128, width: 200, height: 30)
        button.addTarget(self, action: #selector(goSkipAction), for: .allEvents)
        
        return button
    }()

    // MARK: - Public property
    var presentText = Constants.emptyText
    var textDescription = Constants.emptyText
    var imageText = Constants.emptyText
    var currentPage = 0
    var numberOfPages = 0
    var delegate: OnboardingBusinessLogic?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimations()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        disappearAnimations()
    }
    
    // MARK: - Private Objc Methods
    @objc func goForwardAction(_ sender: UIButton) {
        if currentPage < numberOfPages {
            print(currentPage)
            delegate?.goForward(index: currentPage)
        }
    }

    @objc func goSkipAction(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: Constants.defaultsKey)
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Private methods
    private func initMethods() {
        setButtons()
        configureViews()
        setValues()
    }
    
    private func setValues() {
        mainPageImageView.image = UIImage(named: imageText)
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        titleLabel.text = presentText
        descriptionTextLabel.text = textDescription
    }

    private func configureViews() {
        mainPageImageView.addSubview(pageControl)
        mainPageImageView.addSubview(titleLabel)
        mainPageImageView.addSubview(descriptionTextLabel)
        mainPageImageView.addSubview(nextButton)
        mainPageImageView.addSubview(skipButton)
        
        view.backgroundColor = .white
        view.addSubview(mainPageImageView)
    }

    private func setButtons() {
        if currentPage == 2 {
            mainPageImageView.addSubview(startedButton)
            nextButton.isHidden = true
            skipButton.isHidden = true
            pageControl.isHidden = true
        } else {
            skipButton.isHidden = false
            nextButton.isHidden = false
        }
    }

    private func disappearAnimations() {
        titleLabel.alpha = 0.3
        descriptionTextLabel.alpha = 0.3
    }

    private func startAnimations() {
        UILabel.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut) {
            self.titleLabel.alpha = 1
            self.descriptionTextLabel.alpha = 1
        }
    }
}
