//
//  NetworkingProvider.swift
//  Networking
//
//  Created by Ricardo Rodriguez on 10/11/23.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    private let kBaseUrl = "https://gorest.co.in/public/v2/"
    private let kStatusOk = 200...299
    
    func getUser(id: Int) {
        
        let url = "\(kBaseUrl)users/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable  (of: UserResponse.self
//        , decoder: DateDecoder()
        ) { response in
            
            if let user = response.value.self {
                print(user)
            } else {
                print(response.error?.responseCode ?? "No error")
            }
            
        }
    }
    
}
