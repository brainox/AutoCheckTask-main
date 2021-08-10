//
//  CustomTabBarViewController.swift
//  CustomTabBar
//
//  Created by Decagon on 8/9/21.
//

import UIKit

class GeneralTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        delegate = self
        
        setupTabBar()
        setupMiddleTabBar()
    }
   
    fileprivate func setupTabBar() {
        let firstTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
        let secondTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Favorite")
        let thirdTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Cart")
        let fourthTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Notification")
        let fifthTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Chat")
        
        firstTabBar.navigationItem.largeTitleDisplayMode = .always
        secondTabBar.navigationItem.largeTitleDisplayMode = .always
        thirdTabBar.navigationItem.largeTitleDisplayMode = .always
        fourthTabBar.navigationItem.largeTitleDisplayMode = .always
        fifthTabBar.navigationItem.largeTitleDisplayMode = .always
        
        let firstNavBar = UINavigationController(rootViewController: firstTabBar)
        let secondNavBar = UINavigationController(rootViewController: secondTabBar)
        let thirdNavBar = UINavigationController(rootViewController: thirdTabBar)
        let fourthNavBar = UINavigationController(rootViewController: fourthTabBar)
        let fifthNavBar = UINavigationController(rootViewController: fifthTabBar)
        
        firstNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.fill"), tag: 1)
        secondNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart.fill"), tag: 2)
        fourthNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bell.fill"), tag: 3)
        fifthNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "ellipsis.bubble.fill"), tag: 4)
        
        firstNavBar.navigationBar.prefersLargeTitles = false
        secondNavBar.navigationBar.prefersLargeTitles = true
        thirdNavBar.navigationBar.prefersLargeTitles = true
        fourthNavBar.navigationBar.prefersLargeTitles = true
        fifthNavBar.navigationBar.prefersLargeTitles = true
        
        setViewControllers([firstNavBar, secondNavBar, thirdNavBar, fourthNavBar, fifthNavBar], animated: true)
        tabBar.backgroundColor = .white
        tabBar.alpha = 0.9
        tabBar.isTranslucent = true
        self.selectedViewController = firstNavBar
        tabBar.tintColor = .black
    }
    
    private let tabButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .yellow
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = 35
        button.layer.shadowOpacity = 0.3
        return button
    }()
    
    func setupMiddleTabBar() {
        tabButton.frame = CGRect(x: (view.bounds.width-70)/2, y: -25, width: 70, height: 70)
        tabButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        let buttonImage = UIImage(systemName: "lock.fill")
        tabButton.setImage(buttonImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        
        tabBar.addSubview(tabButton)
        view.layoutIfNeeded()
    }
    
    @objc func didTapButton() {
        self.selectedIndex = 2
    }
}

