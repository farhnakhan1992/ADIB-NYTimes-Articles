//
//  AppDelegate.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var reachability = Reachability()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK: - Root Navigation
        if let vc = UIStoryboard.Articles.get(NYTimesArticlesListViewController.self)
        {
            let presenter = NYTimesArticlesListViewPresenter(view: vc)
            vc.presenter = presenter
            window = UIWindow()
            window?.rootViewController = UINavigationController(rootViewController: vc)
            window?.makeKeyAndVisible()
        }
        return true
    }




}

