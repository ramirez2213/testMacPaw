//
//  DetailListOfCatInteractor.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol DetailListOfCatBusinessLogic {
  func makeRequest(request: DetailListOfCat.Model.Request.RequestType)
}

class DetailListOfCatInteractor: DetailListOfCatBusinessLogic {

  var presenter: DetailListOfCatPresentationLogic?
  var service: DetailListOfCatService?
  
  func makeRequest(request: DetailListOfCat.Model.Request.RequestType) {
    if service == nil {
      service = DetailListOfCatService()
    }
  }
  
}
