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
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var interactor: GalleryBusinessLogic?
    var router: (NSObjectProtocol & GalleryRoutingLogic)?
    
    private var galleryViewModel = GalleryViewModel.init(cells: [])
    private var page = 0
    
    private let itemsPerRow :CGFloat = 2
    private let sectionInsearts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
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
        view.backgroundColor = .white
        title = "Gallery"
        setup()
        getRequest()
        setupCollectionView()
        setupSpinner()
    }
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    func displayData(viewModel: Gallery.Model.ViewModel.ViewModelData) {
        
        switch viewModel {
         
        case .getImageURLStringNextBatch(galleryViewModel: let galleryViewModel):
            self.galleryViewModel.cells += galleryViewModel
            self.myCollectionView.reloadData()
            
        }
    }
    
    //MARK: - Get Request
    
    private func getRequest() {
        self.page += 1
        interactor?.makeRequest(request: Gallery.Model.Request.RequestType.getImageNextBatch(page: "\(page)"))
    }
    
    //MARK: - Setup UI elements
    
    private func setupCollectionView(){
        self.myCollectionView.register(UINib(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: GalleryCell.reuseId)
        
        myCollectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        myCollectionView.contentInsetAdjustmentBehavior = .automatic
    }
    
    private func setupSpinner() {
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: myCollectionView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: myCollectionView.centerYAnchor).isActive = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > scrollView.contentSize.height / 2  {
            self.getRequest()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryViewModel.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.reuseId, for: indexPath) as! GalleryCell
        let unsplashPhoto = galleryViewModel.cells[indexPath.item]
        cell.setup(model: unsplashPhoto)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension GalleryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.showPreview(galleryViewModel: galleryViewModel, indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photo = galleryViewModel.cells[indexPath.item]
        let paddingSpace = sectionInsearts.left * (itemsPerRow + 1)
        let avialableWidth = view.frame.width - paddingSpace
        let widthPerItem = avialableWidth / itemsPerRow
        let height = CGFloat(photo.height) * widthPerItem / CGFloat(photo.width)
        return CGSize(width: widthPerItem, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsearts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsearts.left
    }
}
