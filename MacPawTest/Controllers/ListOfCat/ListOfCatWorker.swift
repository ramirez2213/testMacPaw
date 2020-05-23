//
//  ListOfCatWorker.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

class ListOfCatService {
    
    var networking: Networking
    var fetcher: DataFetcher
    
    init() {
        self.networking = NetworkService()
        self.fetcher = NetworkDataFetcher(networking: networking)
    }
    
    func getFeed(completion: @escaping ([FeedResponse]?) -> Void ) {
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else {return}
            completion(feedResponse)
        }
    }
}
