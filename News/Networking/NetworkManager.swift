//
//  NetworkManager.swift
//  News
//
//  Created by Kovalyk Nazar on 5/10/19.
//  Copyright © 2019 Kovalyk Nazar. All rights reserved.
//

import Alamofire

//MARK: Network Mananer request

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    var currentRequest: DataRequest?
    
    func request<T: Decodable>(request: URLRequestConvertible, type: T.Type, completion: @escaping (_ source: Result<T>) -> ()) {
        currentRequest = Alamofire.request(request).responseJSON { (response) in
            
            self.currentRequest = nil
            
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(Result.success(result: object))
                } catch {
                    completion(Result.failure(error: error))
                }
            case .failure(let error):
                completion(Result.failure(error: error))
            }
        }
    }
}

class RequestManager {
    static func cancelReques(requst: DataRequest?) {
        requst?.cancel()
    }
}
