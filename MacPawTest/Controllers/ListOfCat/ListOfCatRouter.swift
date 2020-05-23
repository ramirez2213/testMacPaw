//
//  ListOfCatRouter.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol ListOfCatRoutingLogic {
    func navigateToPushedViewController(value: String)
}

class ListOfCatRouter: NSObject, ListOfCatRoutingLogic {
    weak var viewController: ListOfCatViewController?
    
    init(viewController: ListOfCatViewController) {
        self.viewController = viewController
    }
    
    // MARK: Routing
    
    func navigateToPushedViewController(value: String) {
        let storyboard = UIStoryboard(name: "DetailListOfCat", bundle: nil)
        let customViewController = storyboard.instantiateViewController(withIdentifier: "DetailListOfCatViewController") as! DetailListOfCatViewController
        customViewController.configure(viewModel: DetailListOfCatViewModel(value: value))
        viewController?.navigationController?.pushViewController(customViewController, animated: true)
    }
    
}
