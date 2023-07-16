//
//  AppServerClient.swift
//  MVVMPractice2
//
//  Created by 김지나 on 2023/07/13.
//

import Foundation
import Alamofire

class AppServerClient {
    enum GetFriendsFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias GetFriendsResult = Result<[Friend], GetFriendsFailureReason>
    typealias GetFriendsCompletion = (_ result: GetFriendsResult) -> Void
    
    func getFrieds(completion: @escaping GetFriendsCompletion) {
        let url = "https://jsonplaceholder.typicode.com/posts/1/comments"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .validate().responseDecodable(of: [Friend].self) { response in
            switch response.result {
            case .success:
                do {
                    let jsonArray = try response.result.get()
                    completion(.success(payload: jsonArray.compactMap{$0}))
                } catch {
                    completion(.failure(nil))
                }
                
            case .failure(_):
                if let statusCode = response.response?.statusCode,
                   let reason = GetFriendsFailureReason(rawValue: statusCode) {
                    completion(.failure(reason))
                }
                completion(.failure(nil))
            }
        }
    }
}

fileprivate extension AppServerClient.GetFriendsFailureReason {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "Please login to load your friends."
        case .notFound:
            return "Could not complete request, please try again."
        }
        
    }
}
