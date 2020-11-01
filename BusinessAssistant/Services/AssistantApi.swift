import Foundation

enum AssistantApi: EndPointType {
    case search(text: String)
    case sendMessage(message: String)

    var baseUrl: URL {
        URL(string: "http://1f11551d1c5a.ngrok.io")!
    }
    
    var path: String {
        switch self {
        case .search:
            return "/api/search"
        case .sendMessage:
            return "/api/messages"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .search: return .get
        case .sendMessage: return .post
        }
    }

    var queryItems: [String : String] {
        switch self {
        case .search(let text):
            return ["q": text]
        default:
            return [:]
        }
    }

    var body: [String: String] {
        switch self {
        case .sendMessage(let message):
            return ["message": message]
        default:
            return [:]
        }
    }
}
