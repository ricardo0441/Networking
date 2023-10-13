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
    private let kToken = "4dec65fdf95a95a5af39fcf5944c74834e1385e0ae76cc008598f9ba09a0ab65"
    
    func getUser(id: Int, success: @escaping (_ user: UserResponse) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(kBaseUrl)users/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable  (of: UserResponse.self
//        , decoder: DateDecoder()
        ) { response in
            
            if let user = response.value.self {
                success(user)
            } else {
                failure(response.error)
            }
            
        }
    }
    
    func addUser(user: NewUser, success: @escaping (_ user: UserResponse) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(kBaseUrl)users"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable  (of: UserResponse.self
//        , decoder: DateDecoder()
        ) { response in
            
            if let user = response.value.self, user.id != nil {
                success(user)
            } else {
                failure(response.error)
            }
            
        }
        
    }
    
    func updateUser(id: Int, user: NewUser, success: @escaping (_ user: UserResponse) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(kBaseUrl)users/\(id)"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .put, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable  (of: UserResponse.self
//        , decoder: DateDecoder()
        ) { response in
            
            if let user = response.value.self, user.id != nil {
                success(user)
            } else {
                failure(response.error)
            }
            
        }
        
    }
    
    func deleteUser(id: Int, success: @escaping () -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(kBaseUrl)users/\(id)"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .delete, headers: headers).validate(statusCode: kStatusOk).response { (response) in
            if let error = response.error {
                failure(error)
            } else {
                success()
            }
        }
        
    }
    
}
