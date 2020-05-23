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
    private var fetcher:DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func makeRequest(request: DetailListOfCat.Model.Request.RequestType) {
        if service == nil {
            service = DetailListOfCatService()
        }
        
        switch request {
        case .getDetailList(id: let id):
            service?.getDetailFeed(params: ["breed_id": id], completion: { [weak self] (feedDetailResponse) in
                 guard let feedDetailResponse = feedDetailResponse else {return}
                self?.presenter?.presentData(response: DetailListOfCat.Model.Response.ResponseType.presentList(feed: feedDetailResponse))
            })
        }
        
    }
    
}
