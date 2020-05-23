//
//  ImagePrevieViewController.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 22.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

class ImagePrevieViewController: UIViewController {
    
    var myCollectionView: UICollectionView!
    var galleryViewModel = GalleryViewModel.init(cells: [])
    var passedContentOffset = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.register(ImagePreviewCell.self, forCellWithReuseIdentifier: ImagePreviewCell.reuseId)
        myCollectionView.isPagingEnabled = true
        myCollectionView.scrollToItem(at: passedContentOffset, at: .left, animated: true)
        myCollectionView.selectItem(at: passedContentOffset, animated: true, scrollPosition: .bottom)
        self.view.addSubview(myCollectionView)
        
        myCollectionView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))
    }
    
}

extension ImagePrevieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryViewModel.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagePreviewCell.reuseId, for: indexPath) as! ImagePreviewCell
        let unsplashPhoto = galleryViewModel.cells[indexPath.item]
        cell.setup(model: unsplashPhoto)
        return cell
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension ImagePrevieViewController: UICollectionViewDelegateFlowLayout {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let flowLayout = myCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        flowLayout.itemSize = myCollectionView.frame.size
        
        flowLayout.invalidateLayout()
        
        myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let offset = myCollectionView.contentOffset
        let width  = myCollectionView.bounds.size.width
        
        let index = round(offset.x / width)
        let newOffset = CGPoint(x: index * size.width, y: offset.y)
        
        myCollectionView.setContentOffset(newOffset, animated: false)
        
        coordinator.animate(alongsideTransition: { (context) in
            self.myCollectionView.reloadData()
            
            self.myCollectionView.setContentOffset(newOffset, animated: false)
        }, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let indexPath = passedContentOffset
        self.myCollectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: false)
    }
}
