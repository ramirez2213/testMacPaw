//
//  DetailListOfCatPresenter.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol DetailListOfCatPresentationLogic {
  func presentData(response: DetailListOfCat.Model.Response.ResponseType)
}

class DetailListOfCatPresenter: DetailListOfCatPresentationLogic {
  weak var viewController: DetailListOfCatDisplayLogic?
  
  func presentData(response: DetailListOfCat.Model.Response.ResponseType) {
  
  }
  
}
