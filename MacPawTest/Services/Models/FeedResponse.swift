import Foundation

// MARK: - FeedResponseElement
struct FeedResponse: Decodable {
    let name: String?
    let description: String?
    let id: String?
}
