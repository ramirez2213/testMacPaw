//
//  GalleryRouter.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 19.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol GalleryRoutingLogic {
    func showPreview(galleryViewModel: GalleryViewModel, indexPath: IndexPath)
}

class GalleryRouter: NSObject, GalleryRoutingLogic {
    
    weak var viewController: GalleryViewController?
    
    // MARK: Routing
    
    func showPreview(galleryViewModel: GalleryViewModel, indexPath: IndexPath) {
        let vc = ImagePrevieViewController()
        vc.galleryViewModel = galleryViewModel
        vc.passedContentOffset = indexPath
        viewController?.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    
}
