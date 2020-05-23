//
//  DetailListOfCatModels.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

enum DetailListOfCat {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getDetailList(id: String)
            }
        }
        struct Response {
            enum ResponseType {
                case presentList(feed: FeedDetailResponse)
                
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case detailDisplayListOfCat(feedViewModel: FeedDetailResponse)
            }
        }
    }
    
}

struct DetailModel {
    var lifeSpan: String
    var temperament: String
    var name: String
    var description: String
    var url: String
}
