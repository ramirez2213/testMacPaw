//
//  GalleryPresenter.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 19.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit


protocol GalleryPresentationLogic {
    func presentData(response: Gallery.Model.Response.ResponseType)
}

class GalleryPresenter: GalleryPresentationLogic {
    weak var viewController: GalleryDisplayLogic?
    
    func presentData(response: Gallery.Model.Response.ResponseType) {
        
        switch response {
          
        case .presentImageNextBatch(list: let list):
            let cells = list.map { (feedItem) in
                cellViewModel(from: feedItem)
            }
            viewController?.displayData(viewModel: Gallery.Model.ViewModel.ViewModelData.getImageURLStringNextBatch(galleryViewModel: cells))
            
            
        }
    }
    
    private func cellViewModel(from imageItem: ImageResponse) -> GalleryViewModel.Cell {
        return GalleryViewModel.Cell.init(id: imageItem.id ?? "", url: imageItem.url ?? "", width: imageItem.width ?? 0, height: imageItem.height ?? 0)
    }
}
