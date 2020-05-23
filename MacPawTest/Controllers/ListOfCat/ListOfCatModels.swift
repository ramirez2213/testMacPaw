//
//  ListOfCatModels.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

enum ListOfCat {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getList
      }
    }
    struct Response {
      enum ResponseType {
        case presentList(feed: [FeedResponse])
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayListOfCat(feedViewModel: ListViewModel)
      }
    }
  }
  
}

struct ListViewModel {
    struct Cell:ListCellViewModel {
        var title: String
        var subtitle: String
    }
    let cells: [Cell]
}
