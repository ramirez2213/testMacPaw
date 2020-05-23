//
//  GalleryWorker.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 19.05.2020.
//  Copyright (c) 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

class GalleryService {
    
    var networking: Networking
    var fetcher: DataFetcher
    
    init() {
        self.networking = NetworkService()
        self.fetcher = NetworkDataFetcher(networking: networking)
    }
    
    func getImage(params: [String : Any], complition: @escaping ([ImageResponse]) -> Void) {
        fetcher.getImage(params: params) { (imageResponse) in
            guard let imageResponse = imageResponse else {return}
            complition(imageResponse)
        }
    }
}
