import Foundation

protocol EndPointType {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var queryItems: [String: String] { get }
    var body: [String: String] { get }
}
