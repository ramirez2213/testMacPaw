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
    private var fetcher:DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func makeRequest(request: Quiz.Model.Request.RequestType) {
        if service == nil {
            service = QuizService()
        }
        
        switch request {
            
        case .getDataForQuiz:
            service?.getDetailFeed(params: ["":""], completion: { [weak self] (feedDetailResponse) in
                guard let feedDetailResponse = feedDetailResponse else {return}
                self?.presenter?.presentData(response: Quiz.Model.Response.ResponseType.presentList(feed: feedDetailResponse))
            })
            
        case .sendingParametersToTheRequestForQuiz(imgId: let imgId, value: let value):
            service?.answerDataFromQuiz(parameters: ["image_id" : imgId, "value": value], headerParams: ["x-api-key":"158fb5e9-bbdb-4668-9b88-513f9123068"], completion: { [weak self]  (response) in
            
                guard let answerFromQuiz = response else {return}
                self?.presenter?.presentData(response: Quiz.Model.Response.ResponseType.presentListForQuiz(answ: answerFromQuiz))
            })

        case .getListName:
            service?.getFeed(completion: { [weak self] (feedResponse) in
                 guard let feedResponse = feedResponse else {return}
                self?.presenter?.presentData(response: Quiz.Model.Response.ResponseType.presentBreedListName(feed: feedResponse))
            })
        }
        
    }
    
}
