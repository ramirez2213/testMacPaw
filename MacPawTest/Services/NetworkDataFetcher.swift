//
//  NetworkDataFetcher.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 12.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func getFeed(response: @escaping ([FeedResponse]?) -> Void )
    func getDetailFeed(params: [String: String], response: @escaping (FeedDetailResponse?) -> Void )
    func answerDataFromQuiz(parameters: [String : Any], headerParams: [String : String], response: @escaping (AnswerFromQuiz?) -> Void)
     func getImage(params: [String : Any], response: @escaping ([ImageResponse]?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getFeed(response: @escaping ([FeedResponse]?) -> Void) {
        let params = ["":""]
        networking.request(path: API.breeds, params: params) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: [FeedResponse].self, from: data)
            _ = decoded.map { (feed) in
            response(feed)
        
            }
        }
    }
    
    func getDetailFeed(params: [String : String], response: @escaping (FeedDetailResponse?) -> Void) {
        networking.request(path: API.searchImage, params: params) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: FeedDetailResponse.self, from: data)
            response(decoded)
        
        }
    }
    
    func answerDataFromQuiz(parameters: [String : Any], headerParams: [String : String], response: @escaping (AnswerFromQuiz?) -> Void) {
        networking.postRequest(path: API.votes, headerParams: headerParams, parameters: parameters) { (data, error) in

            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: AnswerFromQuiz.self, from: data)
            response(decoded)
        }
    }
    
    func getImage(params: [String : Any], response: @escaping ([ImageResponse]?) -> Void) {
        networking.request(path: API.searchImage, params: params) { (data, error) in
            if let error = error {
                    print("Error recieved requesting data: \(error.localizedDescription)")
                    response(nil)
                }
                let decoded = self.decodeJSON(type: [ImageResponse].self, from: data)
                response(decoded)
            
        }
    }
    
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
         let decoder = JSONDecoder()
         decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else {return nil}
        return response
    }
}
