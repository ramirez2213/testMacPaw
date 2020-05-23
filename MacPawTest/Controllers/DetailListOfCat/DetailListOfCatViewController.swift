//
//  DetailListOfCatViewController.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol DetailListOfCatDisplayLogic: class {
  func displayData(viewModel: DetailListOfCat.Model.ViewModel.ViewModelData)
}

class DetailListOfCatViewController: UIViewController, DetailListOfCatDisplayLogic {

  var interactor: DetailListOfCatBusinessLogic?
  var router: (NSObjectProtocol & DetailListOfCatRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = DetailListOfCatInteractor()
    let presenter             = DetailListOfCatPresenter()
    let router                = DetailListOfCatRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func displayData(viewModel: DetailListOfCat.Model.ViewModel.ViewModelData) {

  }
  
}
