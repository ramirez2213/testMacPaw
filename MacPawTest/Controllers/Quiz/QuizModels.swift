//
//  QuizModels.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 17.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

enum Quiz {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getDataForQuiz
        case getListName
        case sendingParametersToTheRequestForQuiz(imgId: String, value: Int)
      }
    }
    struct Response {
      enum ResponseType {
        case presentList(feed: FeedDetailResponse)
        case presentBreedListName(feed: [FeedResponse])
        case presentListForQuiz(answ: AnswerFromQuiz)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case detailDisplayListOfCat(feedViewModel: FeedDetailResponse)
        case displayBreedListName(name: String)
      }
    }
  }
  
}
