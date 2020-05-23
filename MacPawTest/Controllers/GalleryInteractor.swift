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
  
  func makeRequest(request: Gallery.Model.Request.RequestType) {
    if service == nil {
      service = GalleryService()
    }
  }
  
}
