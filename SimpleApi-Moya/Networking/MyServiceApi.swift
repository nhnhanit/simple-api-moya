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

enum MyServiceApi {
    case users(page: Int)
    case detailUser(id: Int)
}
extension MyServiceApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://reqres.in/api/") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .users(let page):
            return "users?page=\(page)"
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
