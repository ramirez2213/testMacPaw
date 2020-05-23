//
//  MainTabBarController.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ListOfCatVC:ListOfCatViewController = ListOfCatViewController.loadFromStoryboard()
        let QuizVC:QuizViewController = QuizViewController.loadFromStoryboard()
        let Gallery:GalleryViewController = GalleryViewController.loadFromStoryboard()
        
        viewControllers = [
            generateViewController(rootVC: ListOfCatVC, image: UIImage(systemName: "house")!, title: "Breeds"),
            generateViewController(rootVC: QuizVC, image: UIImage(systemName: "gamecontroller")!, title: "Quiz"),
            generateViewController(rootVC: Gallery, image: UIImage(systemName: "photo")!, title: "Gallery")
        ]
    }
    
    private func generateViewController(rootVC: UIViewController, image: UIImage, title: String) -> UIViewController {
            let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = false
        return navigationVC
    }
}
