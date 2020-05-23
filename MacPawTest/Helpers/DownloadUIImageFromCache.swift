//
//  WebImageView.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 21.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            //                   print("from cachе")
            return
        }
        //        print("from internet")

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async() { [weak self] in
                if let data = data, let response = response {
                    guard let responseURL = response.url else { return }
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
                    if responseURL == url {
                        self?.image = UIImage(data: data)
                    }
                }
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
