//
//  ImageResponse .swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 20.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//


import Foundation

// MARK: - ImageResponseElement
struct ImageResponse: Decodable {
    var breeds: [Brd]?
    var id: String?
    var url: String?
    var width, height: Int?
}

// MARK: - Breed
struct Brd: Codable {
}

// MARK: - Weight
struct Weightt: Codable {
    var imperial, metric: String?
}


