//
//  ListOfCatInteractor.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol ListOfCatBusinessLogic {
    func makeRequest(request: ListOfCat.Model.Request.RequestType)
}

class ListOfCatInteractor: ListOfCatBusinessLogic {
    
    var presenter: ListOfCatPresentationLogic?
    var service: ListOfCatService?
    private var fetcher:DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func makeRequest(request: ListOfCat.Model.Request.RequestType) {
        if service == nil {
            service = ListOfCatService()
        }
        
        switch request {
            
        case .getList:
            service?.getFeed(completion: { [weak self] (feedResponse) in
                 guard let feedResponse = feedResponse else {return}
                 self?.presenter?.presentData(response: ListOfCat.Model.Response.ResponseType.presentList(feed: feedResponse))
            })
         
        }
        
    }
    
    
    
}
