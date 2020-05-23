//
//  QuizViewController.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 17.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol QuizDisplayLogic: class {
    func displayData(viewModel: Quiz.Model.ViewModel.ViewModelData)
}

class QuizViewController: UIViewController, QuizDisplayLogic {
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var breedLabel: UILabel!
    
    private let activityIndicator = ActivityIndicator()
    var interactor: QuizBusinessLogic?
    var router: (NSObjectProtocol & QuizRoutingLogic)?
    var imgId: String?
        
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = QuizInteractor()
        let presenter             = QuizPresenter()
        let router                = QuizRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(activityIndicator)
        setup()
        getRequest()
    }
    
    func displayData(viewModel: Quiz.Model.ViewModel.ViewModelData) {
        
        switch viewModel {
        case .detailDisplayListOfCat(feedViewModel: let feedViewModel):
            setupView(model: feedViewModel)
            feedViewModel.forEach {
                self.imgId = $0.id
            }
            activityIndicator.hide()
        case .displayBreedListName(name: let name):
            self.breedLabel.text = name
        }
    }
    
    private func getRequest() {
        interactor?.makeRequest(request: Quiz.Model.Request.RequestType.getDataForQuiz)
        interactor?.makeRequest(request: Quiz.Model.Request.RequestType.getListName)
    }
    
    private func setupView(model: FeedDetailResponse) {
        _ = model.map { (feedDetail) in
            imageView?.downloaded(from:feedDetail.url!)
        }
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        activityIndicator.show()
        guard let id = imgId else {return}
        interactor?.makeRequest(request: Quiz.Model.Request.RequestType.sendingParametersToTheRequestForQuiz(imgId: id, value: 0))
        getRequest()
    }
    
    @IBAction func dislikeButtonAction(_ sender: Any) {
        activityIndicator.show()
        guard let id = imgId else {return}
        interactor?.makeRequest(request: Quiz.Model.Request.RequestType.sendingParametersToTheRequestForQuiz(imgId: id, value: 1))
        getRequest()
    }
}
