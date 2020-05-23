//
//  GalleryInteractor.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 19.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol GalleryBusinessLogic {
    func makeRequest(request: Gallery.Model.Request.RequestType)
}

class GalleryInteractor: GalleryBusinessLogic {
    
    var presenter: GalleryPresentationLogic?
    var service: GalleryService?
    private var fetcher:DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func makeRequest(request: Gallery.Model.Request.RequestType) {
        if service == nil {
            service = GalleryService()
        }
        
        switch request {
        
        case .getImageNextBatch(page: let page):
            service?.getImage(params: ["limit" : "10", "page": page], complition: { [weak self] (imageResponse) in
                self?.presenter?.presentData(response: Gallery.Model.Response.ResponseType.presentImageNextBatch(list: imageResponse))
            })
        }
    }
}
