import Foundation

struct SearchResponse: Decodable {
    let id: String
    let name: String
    let description: String
    let uri: String
}
