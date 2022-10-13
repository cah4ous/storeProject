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
 
        static let ImageSizeForLargeState: CGFloat = 40
        static let ImageRightMargin: CGFloat = 16
        static let ImageBottomMarginForLargeState: CGFloat = 12
        static let ImageBottomMarginForSmallState: CGFloat = 6
        static let ImageSizeForSmallState: CGFloat = 32
        static let NavBarHeightSmallState: CGFloat = 44
        static let NavBarHeightLargeState: CGFloat = 96.5
    }
    
    // MARK: - Private Visual Components
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.frame
        scrollView.contentInset = UIEdgeInsets(top: -200, left: 0, bottom: 0, right: 0)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        
        return scrollView
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
        label.frame = CGRect(x: 20, y: 170, width: 240, height: 100)
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
        button.frame = CGRect(x: 180, y: 100, width: 30, height: 30)
        button.setBackgroundImage(UIImage(systemName: Constants.avatarImageName), for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.tintColor = .gray

        return button
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(systemName: Constants.avatarImageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
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
    @objc private func avatarImageViewAction() {
         let imagePickerController = UIImagePickerController()
         imagePickerController.sourceType = .photoLibrary
         imagePickerController.allowsEditing = true
         imagePickerController.delegate = self
         present(imagePickerController, animated: true)
     }
    
    // MARK: - Private Methods
    private func initMethods() {
        configureViews()
        mainScrollView.delegate = self
        settingsView()
        setupAvatarButtonImage()
        addTargets()
        
        createGrayLine(frame: CGRect(x: 5, y: 200, width: view.bounds.width - 7, height: 2))
        createGrayLine(frame: CGRect(x: 20, y: 335, width: 360, height: 2))
        
        createChevronImageView(frame: CGRect(x: 340, y: 290, width: 12, height: 12))
    }
    
    private func settingsView() {
        title = Constants.forYouText
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(avatarImageView)

        NSLayoutConstraint.activate([
            avatarImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                             constant: -Constants.ImageRightMargin),
            avatarImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                              constant: -Constants.ImageBottomMarginForLargeState),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.ImageSizeForLargeState),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor)
            ])
        
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Constants.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Constants.NavBarHeightLargeState - Constants.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()

        let factor = Constants.ImageSizeForSmallState / Constants.ImageSizeForLargeState

        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()

        let sizeDiff = Constants.ImageSizeForLargeState * (1.0 - factor)

        let yTranslation: CGFloat = {
            let maxYTranslation = Constants.ImageBottomMarginForLargeState
            - Constants.ImageBottomMarginForSmallState + sizeDiff
            return max(0,
                       min(maxYTranslation,
                           (maxYTranslation - coeff * (Constants.ImageBottomMarginForSmallState + sizeDiff))))
        }()

        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

        avatarImageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    private func configureViews() {
        mainScrollView.addSubview(productView)
        mainScrollView.addSubview(newsLabel)
        mainScrollView.addSubview(deliveryProgressView)
        mainScrollView.addSubview(treatmentLabel)
        mainScrollView.addSubview(sendedtLabel)
        mainScrollView.addSubview(deliveredLabel)
        mainScrollView.addSubview(orderLabel)
        mainScrollView.addSubview(countOrderLabel)
        mainScrollView.addSubview(mainImageView)
        mainScrollView.addSubview(devicesLabel)
        mainScrollView.addSubview(showAllButton)
        mainScrollView.addSubview(recomendedImageView)
        mainScrollView.addSubview(recomendedLabel)
        mainScrollView.addSubview(recomendedNotificationsLabel)
        mainScrollView.addSubview(recomendedNewsLabel)
        mainScrollView.addSubview(chevronImageView)
        
        view.addSubview(mainScrollView)
        
        view.backgroundColor = UIColor(named: Constants.viewBackColor)
    }
    
    private func createGrayLine(frame: CGRect) {
        let lineView = UIView()
        lineView.frame = frame
        lineView.setUnderLine()
        
        mainScrollView.addSubview(lineView)
    }
    
    private func createChevronImageView(frame: CGRect) {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.chevronForward)
        imageView.tintColor = .systemGray2
        imageView.frame = frame
        
        mainScrollView.addSubview(imageView)
    }
    
    private func addTargets() {
        avatarImageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(avatarImageViewAction))
        )
    }
    
    private func setupAvatarButtonImage() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: Constants.avatarKey) as? Data else { return }
        guard let imageData = UIImage(data: data) else { return }
        let img = imageData.resizeImage(to: CGSize(width: 30, height: 30))
        avatarImageView.image = img
     }
}

/// UIImagePickerControllerDelegate
extension PersonViewController: UIImagePickerControllerDelegate {
     func imagePickerController(_ picker: UIImagePickerController,
                                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
         picker.dismiss(animated: true)
         if let image = info[.originalImage] as? UIImage {
             let img = image.resizeImage(to: CGSize(width: 30, height: 30))
             avatarImageView.image = img
             guard let imageData = image.pngData() else { return }
             UserDefaults.standard.set(imageData, forKey: Constants.avatarKey)
         }
         self.dismiss(animated: true)
     }
 }

extension PersonViewController: UIScrollViewDelegate {
    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}

/// UINavigationControllerDelegate
extension PersonViewController: UINavigationControllerDelegate {
}

/// UIImage
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
