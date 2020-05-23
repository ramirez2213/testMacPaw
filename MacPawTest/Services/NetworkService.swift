//
//  NetworkService.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 08.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

protocol Networking {
    func request(path: String, params: [String: Any], complition: @escaping (Data?,Error?) -> Void)
    func postRequest(path: String, headerParams: [String : String], parameters: [String : Any], complition: @escaping (Data?, Error?) -> Void)
    //    func test ()
}

final class NetworkService: Networking {
     
    func request(path: String, params: [String: Any], complition: @escaping (Data?, Error?) -> Void) {
        let url = self.url(from: path, params: params)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        let task = createDataTask(from: request, complition: complition)
        task.resume()
        print(url)
    }
    
    func postRequest(path: String, headerParams: [String : String], parameters: [String : Any], complition: @escaping (Data?, Error?) -> Void) {
        let url = self.url(from: path, params: headerParams)
        var  jsonData = NSData()
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) as NSData
        } catch {
            print(error.localizedDescription)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData as Data
        request.setValue("\(jsonData.length)", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = createDataTask(from: request, complition: complition)
        task.resume()
        print(url)
    }
    
    private func prepareHeaders() -> [String:String]?{
        var headers = [String:String]()
        headers["x-api-key"] = "158fb5e9-bbdb-4668-9b88-513f9123068"
        return headers
    }

    
    private func createDataTask(from request: URLRequest, complition: @escaping (Data?,Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                complition(data,error)
            }
        }
    }
    
    private func url(from path: String, params: [String: Any]) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        components.queryItems = params.map {  URLQueryItem(name: $0, value: $1 as? String) }
        return components.url!
    }
}

