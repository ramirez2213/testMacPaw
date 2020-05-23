//
//  DetailListOfCatWorker.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

class DetailListOfCatService {
    
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
}
