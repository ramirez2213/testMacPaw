//
//  QuizInteractor.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 17.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol QuizBusinessLogic {
  func makeRequest(request: Quiz.Model.Request.RequestType)
}

class QuizInteractor: QuizBusinessLogic {

  var presenter: QuizPresentationLogic?
  var service: QuizService?
  
  func makeRequest(request: Quiz.Model.Request.RequestType) {
    if service == nil {
      service = QuizService()
    }
  }
  
}
