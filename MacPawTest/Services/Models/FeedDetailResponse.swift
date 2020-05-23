//
//  FeedDetailResponse.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 16.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let feedDetailResponse = try? newJSONDecoder().decode(FeedDetailResponse.self, from: jsonData)

import Foundation

// MARK: - FeedDetailResponseElement
struct FeedDetailResponseElement: Codable {
    var breeds: [Breed]?
    var id: String?
    var url: String?
    var width, height: Int?
}

// MARK: - Breed
struct Breed: Codable {
    var weight: Weight?
    var id, name, temperament, origin: String?
    var countryCodes, countryCode, breedDescription, lifeSpan: String?
    var indoor, lap: Int?
    var altNames: String?
    var adaptability, affectionLevel, childFriendly, dogFriendly: Int?
    var energyLevel, grooming, healthIssues, intelligence: Int?
    var sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int?
    var experimental, hairless, natural, rare: Int?
    var rex, suppressedTail, shortLegs: Int?
    var wikipediaURL: String?
    var hypoallergenic: Int?

    enum CodingKeys: String, CodingKey {
        case weight, id, name, temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case breedDescription = "description"
        case lifeSpan = "life_span"
        case indoor, lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
    }
}

// MARK: - Weight
struct Weight: Codable {
    var imperial, metric: String?
}

typealias FeedDetailResponse = [FeedDetailResponseElement]
