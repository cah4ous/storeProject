//
//  ForYouViewController.swift
//  storeProjectDZ
//
//  Created by Александр Троицкий on 05.10.2022.
//

import UIKit
/// Экран пользователя
final class PersonViewController: UIViewController {
    private enum Constants {
        static let forYouText = "Для вас"
        static let newsText = "Вот что нового"
        static let devicesText = "ваши устройства"
        static let avatarKey = "avatar"
        static let showAllText = "Показать все"
        static let recomendText = "Рекомендуется вам"
        static let recomentNewsText = "Получайте новости в своем заказе в режиме реального времени."
        static let recomendNotificationText = "Включите уведомления, чтобы получить новости о своем заказе."
        static let treatmentText = "Обрабатывается"
        static let sendedText = "Отправлено"
        static let deliveredText = "Доставлено"
        static let orderText = "Ваш заказ отправлен."
        static let countOrderText = "1 товар, доставка завтра"
        static let mainTextColor = "mainTextColor"
        static let searchColor = "searchaColor"
        static let tabColor = "tabColor"
        static let viewBackColor = "viewBackColor"
        static let chevronForward = "chevron.forward"
        static let airpodsImageName = "apple-airpod"
        static let recommendedImageName = "app.badge"
        static let avatarImageName = "person.fill"
    }
    
    // MARK: - Private Visual Components
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 300, width: view.bounds.width, height: view.bounds.height)
        scrollView.contentInset = UIEdgeInsets(top: -290, left: 0, bottom: 0, right: 0)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1300)
        
        return scrollView
    }()
    
    private lazy var forYouLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 35)
        label.frame = CGRect(x: 20, y: 100, width: 140, height: 100)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.forYouText
        
        return label
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
       imageView.image = UIImage(named: Constants.airpodsImageName)
       imageView.frame = CGRect(x: 35, y: 270, width: 55, height: 55)
       imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 110, y: 220, width: 240, height: 120)
        label.numberOfLines = 0
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.orderText
        
        return label
    }()
    
    private lazy var countOrderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.frame = CGRect(x: 110, y: 250, width: 240, height: 120)
        label.numberOfLines = 0
        label.textColor = UIColor.systemGray2
        label.text = Constants.countOrderText
        
        return label
    }()
    
    private lazy var treatmentLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.frame = CGRect(x: 30, y: 330, width: 140, height: 100)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.treatmentText
        
        return label
    }()
    
    private lazy var sendedtLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.frame = CGRect(x: 170, y: 330, width: 140, height: 100)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.sendedText
        
        return label
    }()
    
    private lazy var deliveredLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.frame = CGRect(x: 290, y: 330, width: 140, height: 100)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.deliveredText
        
        return label
    }()
    
    private lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.chevronForward)
        imageView.tintColor = .systemGray2
        imageView.frame = CGRect(x: 365, y: 590, width: 12, height: 12)
        
        return imageView
    }()
    
    private lazy var productView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.frame = CGRect(x: 20, y: 250, width: 350, height: 140)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.3
        
        return view
    }()
    
    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.frame = CGRect(x: 20, y: 155, width: 240, height: 100)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.newsText
        
        return label
    }()
    
    private lazy var recomendedLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 20, y: 450, width: 240, height: 100)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.recomendText
        
        return label
    }()
    
    private lazy var recomendedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.recommendedImageName)
        imageView.frame = CGRect(x: 40, y: 550, width: 40, height: 40)
        imageView.tintColor = .systemPink
        
        return imageView
    }()
    
    private lazy var deliveryProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.4, animated: true)
        progressView.frame = CGRect(x: 30, y: 360, width: 328, height: 30)

        progressView.tintColor = .systemGreen
        progressView.layer.transform = CATransform3DMakeScale(1, 1.2, 0)
        
        return progressView
    }()
    
    private lazy var recomendedNewsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.frame = CGRect(x: 120, y: 520, width: 240, height: 120)
        label.numberOfLines = 0
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.recomentNewsText
        
        return label
    }()
    
    private lazy var recomendedNotificationsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.frame = CGRect(x: 120, y: 565, width: 240, height: 120)
        label.numberOfLines = 0
        label.textColor = UIColor.systemGray2
        label.text = Constants.recomendNotificationText
        
        return label
    }()
    
    private lazy var devicesLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.frame = CGRect(x: 20, y: 660, width: 240, height: 100)
        label.textColor = UIColor(named: Constants.mainTextColor)
        label.text = Constants.devicesText
        
        return label
    }()
    
    private lazy var showAllButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.showAllText, for: .normal)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.frame = CGRect(x: 250, y: 675, width: 150, height: 75)

        return button
    }()
    
    private lazy var avatarButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 300, y: 40, width: 50, height: 50)
        button.setBackgroundImage(UIImage(systemName: Constants.avatarImageName), for: .normal)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.tintColor = .gray

        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         overrideUserInterfaceStyle = .light
         navigationController?.overrideUserInterfaceStyle = .light
         tabBarController?.overrideUserInterfaceStyle = .light
     }

     override func viewWillDisappear(_ animated: Bool) {
         overrideUserInterfaceStyle = .dark
         navigationController?.overrideUserInterfaceStyle = .dark
         tabBarController?.overrideUserInterfaceStyle = .dark
     }
    
    // MARK: - Private Objc Methods
    
    @objc private func avatarButtonAction(_ sender: UIButton) {
         let imagePickerController = UIImagePickerController()
         imagePickerController.sourceType = .photoLibrary
         imagePickerController.allowsEditing = true
         imagePickerController.delegate = self
         present(imagePickerController, animated: true)
     }
    
    // MARK: - Private Methods
    private func initMethods() {
        configureViews()
        settingsView()
        setupAvatarButtonImage()
        addTargets()
        
        createGrayLine(frame: CGRect(x: 5, y: 150, width: view.bounds.width - 7, height: 2))
        createGrayLine(frame: CGRect(x: 20, y: 335, width: 360, height: 2))
        
        createChevronImageView(frame: CGRect(x: 340, y: 290, width: 12, height: 12))
    }
    
    private func settingsView() {
        title = Constants.forYouText
        navigationController?.navigationBar.addSubview(avatarButton)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureViews() {
        view.addSubview(productView)
        view.addSubview(newsLabel)
        view.addSubview(mainScrollView)
        view.addSubview(deliveryProgressView)
        view.addSubview(treatmentLabel)
        view.addSubview(sendedtLabel)
        view.addSubview(deliveredLabel)
        view.addSubview(orderLabel)
        view.addSubview(countOrderLabel)
        view.addSubview(mainImageView)
        
        mainScrollView.addSubview(devicesLabel)
        mainScrollView.addSubview(showAllButton)
        mainScrollView.addSubview(recomendedImageView)
        mainScrollView.addSubview(recomendedLabel)
        mainScrollView.addSubview(recomendedNotificationsLabel)
        mainScrollView.addSubview(recomendedNewsLabel)
        mainScrollView.addSubview(chevronImageView)
        
        view.backgroundColor = UIColor(named: Constants.viewBackColor)
    }
    
    private func createGrayLine(frame: CGRect) {
        let lineView = UIView()
        lineView.frame = frame
        lineView.setUnderLine()
        
        view.addSubview(lineView)
    }
    
    private func createChevronImageView(frame: CGRect) {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.chevronForward)
        imageView.tintColor = .systemGray2
        imageView.frame = frame
        
        view.addSubview(imageView)
    }
    
    private func addTargets() {
        avatarButton.addTarget(self, action: #selector(avatarButtonAction), for: .touchUpInside)
    }
    
    private func setupAvatarButtonImage() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: Constants.avatarKey) as? Data else { return }
        guard let imageData = UIImage(data: data) else { return }
        avatarButton.setBackgroundImage(imageData, for: .normal)
     }
}

extension PersonViewController: UIImagePickerControllerDelegate {
     func imagePickerController(_ picker: UIImagePickerController,
                                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
         picker.dismiss(animated: true)
         if let image = info[.originalImage] as? UIImage {
             let img = image.resizeImage(to: CGSize(width: 50, height: 50))
             avatarButton.setImage(img, for: .normal)
             guard let imageData = image.pngData() else { return }
             UserDefaults.standard.set(imageData, forKey: Constants.avatarKey)
         }
         self.dismiss(animated: true)
     }
 }

extension PersonViewController: UINavigationControllerDelegate {
}

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
