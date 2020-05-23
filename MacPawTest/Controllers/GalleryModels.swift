//
//  GalleryModels.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 19.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

enum Gallery {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getImageNextBatch(page: String)
      }
    }
    struct Response {
      enum ResponseType {
        case presentImageNextBatch(list: [ImageResponse])
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case getImageURLStringNextBatch(galleryViewModel: [GalleryViewModel.Cell])
      }
    }
  }
  
}

struct GalleryViewModel {
    struct Cell: GalleryCellViewModel {
        var id: String
        var url: String
        var width: Int
        var height: Int
    }
    var cells: [Cell]
}
