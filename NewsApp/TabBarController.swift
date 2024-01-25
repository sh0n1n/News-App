//
//  TabBarController.swift
//  NewsApp
//
//  Created by Melkor on 12/17/23.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.tintColor = .systemGray4
        setupViewContollers()
    }
    
    private func setupViewContollers() {
        
        viewControllers = [
            setupNavigationController(rootViewController: GeneralViewController(viewModel: GeneralViewModel()), title: "General", image: UIImage(systemName: "newspaper") ?? UIImage.add),
            setupNavigationController(rootViewController: EntertainmentViewController(viewModel: EntertainmentViewModel()), title: "Entertainment", image: UIImage(systemName: "gamecontroller") ?? UIImage.add),
            setupNavigationController(rootViewController: TechnologyViewController(viewModel: TechnologyViewModel()), title: "Technology", image: UIImage(systemName: "gyroscope") ?? UIImage.add)
            ]
    }
    
    private func setupNavigationController(rootViewController: UIViewController,
                                           title: String,
                                           image: UIImage) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController:
                                                            rootViewController)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}
