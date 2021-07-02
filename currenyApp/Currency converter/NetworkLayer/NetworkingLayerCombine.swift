import Foundation
import Combine
import Alamofire


// MARK: - Network Controller
protocol NetworkProviderProtocol: class {
    typealias Headers = [String: Any]
    
    func get<T>(type: T.Type,
                endpoint : EndPointProtcol
    ) -> DataResponsePublisher<T> where T: Decodable
}

final class DefaultNetworkProvider: NetworkProviderProtocol {
    func get<T: Decodable>(type: T.Type,
                           endpoint : EndPointProtcol) -> DataResponsePublisher<T> {
        return AF.request(endpoint.path, method: endpoint.method, parameters: (endpoint.body != nil) ? endpoint.body : nil, headers: (endpoint.headers != nil) ? endpoint.headers : nil).publishDecodable(type: T.self)
    }
}


