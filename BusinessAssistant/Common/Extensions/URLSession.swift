import Foundation

extension URLSession {
    func dataTask(with urlRequest: URLRequest, result: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        
        return dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "Error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success(data))
        }
    }
}
