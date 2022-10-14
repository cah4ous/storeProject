//
//  WebViewController.swift
//  storeProjectHW
//
//  Created by Александр Троицкий on 11.10.2022.
//

import UIKit
import WebKit

/// Экран web
final class WebViewController: UITabBarController {
    private enum Constants {
        static let mainUrl = "https://www.apple.com"
        static let backButtonImage = "chevron.backward"
        static let forwardButtonImage = "chevron.forward"
        static let refreshButtonImage = "goforward"
        static let shareButtonImage = "square.and.arrow.up"
        static let tabColor = "tabColor"
    }

    // MARK: Private Visual Components
    private var backButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 15, y: 10, width: 30, height: 30)
        button.setImage(UIImage(systemName: Constants.backButtonImage), for: .normal)
        
        return button
    }()
    
    private var forwardButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 50, y: 10, width: 30, height: 30)
        button.setImage(UIImage(systemName: Constants.forwardButtonImage), for: .normal)
        
        return button
    }()
    
    private var refreshButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 315, y: 10, width: 30, height: 30)
        button.setImage(UIImage(systemName: Constants.refreshButtonImage), for: .normal)
        
        return button
    }()
    
    private var shareButton: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 345, y: 10, width: 30, height: 30)
        button.setImage(UIImage(systemName: Constants.shareButtonImage), for: .normal)
        
        return button
    }()
    
    private var progressView: UIProgressView = {
        var newProgressView = UIProgressView()
        newProgressView.frame = CGRect(x: 80, y: 22, width: 230, height: 1)
        
        return newProgressView
    }()
    
    private lazy var tabView: UIView = {
        let newView = UIView()
        newView.backgroundColor = UIColor(named: Constants.tabColor)
        newView.frame = CGRect(x: 0, y: view.bounds.height - 115, width: view.bounds.width, height: 115)
        newView.layer.cornerRadius = 10
        
        return newView
    }()
    
    // MARK: - Public Properties
    var urlOfContent = Constants.mainUrl
    
    // MARK: - Private Properties
    
    private var webView = WKWebView()
    private var estimatedProgressObserver: NSKeyValueObservation?
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initMethods()
        initWebView()
    }
    
    private func initMethods() {
        setupEstimatedProgressObserver()
        tabViewInit()
        initAddTarget()
        configureViews()
    }
    
    // MARK: - Private Objc Methods
    @objc private func backButtonAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }
    
    @objc private func forwardButtonAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }
    
    @objc private func refreshButtonAction() {
        webView.reload()
    }
    
    @objc func shareButtonAction() {
        let items = [URL(string: urlOfContent)]
        let activityViewController = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        present(activityViewController, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func initAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        forwardButton.addTarget(self, action: #selector(forwardButtonAction), for: .touchUpInside)
        refreshButton.addTarget(self, action: #selector(refreshButtonAction), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
    }
    
    private func initWebView() {
        webView.navigationDelegate = self
        webView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 115)

        tabBarController?.tabBar.isHidden = true
        if let url = URL(string: urlOfContent) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    private func tabViewInit() {
        tabView.addSubview(backButton)
        tabView.addSubview(forwardButton)
        tabView.addSubview(progressView)
        tabView.addSubview(refreshButton)
        tabView.addSubview(shareButton)
    }
    
    private func configureViews() {
        view.addSubview(webView)
        view.addSubview(tabView)
    }
    
    private func setupEstimatedProgressObserver() {
        estimatedProgressObserver = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] webView, _ in
            self?.progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
}

extension WebViewController: WKNavigationDelegate {
    func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
        if progressView.isHidden {
            progressView.isHidden = false
        }

        UIView.animate(withDuration: 0.33,
                       animations: {
                           self.progressView.alpha = 1.0
        })
    }

}
