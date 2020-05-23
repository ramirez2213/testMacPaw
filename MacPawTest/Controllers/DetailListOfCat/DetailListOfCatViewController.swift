//
//  DetailListOfCatViewController.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

final class DetailListOfCatViewModel {
    
    let value: String
    
    init(value: String) {
        self.value = value
    }
}

protocol DetailListOfCatDisplayLogic: class {
    func displayData(viewModel: DetailListOfCat.Model.ViewModel.ViewModelData)
}

final class DetailListOfCatViewController: UIViewController, DetailListOfCatDisplayLogic {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var interactor: DetailListOfCatBusinessLogic?
    var router: (NSObjectProtocol & DetailListOfCatRoutingLogic)?
    
    private var viewModel: DetailListOfCatViewModel!
    
    func configure(viewModel: DetailListOfCatViewModel) {
        self.viewModel = viewModel
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
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
        assert(viewModel != nil, "viewModel is nil. You should call configure method before push vc.")
        interactor?.makeRequest(request: DetailListOfCat.Model.Request.RequestType.getDetailList(id: viewModel.value))
    }
    
    func displayData(viewModel: DetailListOfCat.Model.ViewModel.ViewModelData) {
        
        switch viewModel {
            
        case .detailDisplayListOfCat(feedViewModel: let feedViewModel):
            setupView(model: feedViewModel)
            
        }
    }
    
    private func setupView(model: FeedDetailResponse) {
        _ = model.map { (feedDetail) in
            imageView.downloaded(from: feedDetail.url!)
            _ =  feedDetail.breeds.map { (breed)  in
                breed.map { (bred) in
                    self.nameLabel?.text = "Name: \(bred.name!)"
                    self.descriptionLabel.text = bred.breedDescription
                    self.temperamentLabel.text = "Temperament: \(bred.temperament!)"
                    title = bred.name!
                }
            }
        }
    }
    
}
