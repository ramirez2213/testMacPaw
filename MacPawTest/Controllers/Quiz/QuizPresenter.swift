//
//  QuizPresenter.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 17.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol QuizPresentationLogic {
  func presentData(response: Quiz.Model.Response.ResponseType)
}

class QuizPresenter: QuizPresentationLogic {
  weak var viewController: QuizDisplayLogic?
  
  func presentData(response: Quiz.Model.Response.ResponseType) {
  
  }
  
}
