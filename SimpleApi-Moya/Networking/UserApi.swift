//
//  UserApi.swift
//  SimpleApi-Moya
//
//  Created by HongNhan on 11/27/20.
//
/*
 https://jsonplaceholder.typicode.com/users
 */
import Foundation
import Moya

enum UserApi {
    case users
    case detailUser(id:Int)
}
extension UserApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .users:
            return "users"
        case .detailUser(let id):
            return "users/\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .users, .detailUser: // Send no parameters
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    // stuff
}
