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
  
  }
  
}
