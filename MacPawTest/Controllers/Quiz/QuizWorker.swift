//
//  QuizWorker.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 17.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

class QuizService {
    
    var networking: Networking
    var fetcher: DataFetcher
    
    init() {
        self.networking = NetworkService()
        self.fetcher = NetworkDataFetcher(networking: networking)
    }

    func getDetailFeed(params: [String: String], completion: @escaping (FeedDetailResponse?) -> Void ) {
        fetcher.getDetailFeed(params: params) { (feedDetailResponse) in
            guard let feedDetailResponse = feedDetailResponse else {return}
            completion(feedDetailResponse)
        }
    }
        
    func answerDataFromQuiz(parameters: [String : Any], headerParams: [String : String], completion: @escaping (AnswerFromQuiz?) -> Void) {
        fetcher.answerDataFromQuiz(parameters: parameters, headerParams: headerParams) { (response) in
            guard let answerFromQuiz = response else {return}
            completion(answerFromQuiz)
        }
    }
    
    func getFeed(completion: @escaping ([FeedResponse]?) -> Void ) {
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else {return}
           
        completion(feedResponse)
        }
    }
}
