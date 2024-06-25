//
//  ViewController.swift
//  WhereToGo_Honam
//
//  Created by 권정근 on 6/25/24.
//

import UIKit

class MainTabBarViewController: UITabBarController{
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupTabBar()
    }
    
    // MARK: - Functions
    private func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let notificationVC = UINavigationController(rootViewController: NotificationViewController())
        let directMessageVC = UINavigationController(rootViewController: DirectMessageViewController())
        
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fille")
        
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        notificationVC.tabBarItem.image = UIImage(systemName: "bell")
        notificationVC.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        directMessageVC.tabBarItem.image = UIImage(systemName: "envelope")
        directMessageVC.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        tabBar.tintColor = .label
        tabBar.unselectedItemTintColor = .darkGray
        
        setupTabbarColor()
        
        setViewControllers([homeVC, searchVC, notificationVC, directMessageVC], animated: true)
    }
    
    func setupTabbarColor() {
        let appearance = UITabBarAppearance()
        let tabBar = UITabBar()
        appearance.configureWithOpaqueBackground()
        // appearance.backgroundColor = UIColor.systemBrown
        tabBar.standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        // set tabbar shadow
        // 아래 코드는 탭바의 레이어 선 안보이게 하는 역할
        // tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 6
    }
}
