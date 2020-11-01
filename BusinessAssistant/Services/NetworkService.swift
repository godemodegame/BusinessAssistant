import Foundation

protocol NetworkService: AnyObject {
    func request(_ endpointType: EndPointType, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkServiceImpl: NetworkService {
    func request(_ endpointType: EndPointType, completion: @escaping (Result<Data, Error>) -> Void) {
        guard var urlComponents = URLComponents(url: endpointType.baseUrl, resolvingAgainstBaseURL: true) else {
            fatalError("no url")
        }
        var queryItems: [URLQueryItem] = []
        endpointType.queryItems.forEach {
            queryItems.append(URLQueryItem(name: $0, value: $1))
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return
        }

        var urlRequest = URLRequest(url: url.appendingPathComponent(endpointType.path))
        urlRequest.httpMethod = endpointType.httpMethod.rawValue
        if let dataBody = try? JSONSerialization.data(withJSONObject: endpointType.body, options: []) {
            urlRequest.httpBody = dataBody
        }
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: urlRequest, result: completion).resume()
    }
}
