//
//  GalleryViewController.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 19.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol GalleryDisplayLogic: class {
  func displayData(viewModel: Gallery.Model.ViewModel.ViewModelData)
}

class GalleryViewController: UIViewController, GalleryDisplayLogic {

  var interactor: GalleryBusinessLogic?
  var router: (NSObjectProtocol & GalleryRoutingLogic)?

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
    let interactor            = GalleryInteractor()
    let presenter             = GalleryPresenter()
    let router                = GalleryRouter()
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
  
  func displayData(viewModel: Gallery.Model.ViewModel.ViewModelData) {

  }
  
}
