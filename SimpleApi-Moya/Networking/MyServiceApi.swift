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
    case register(registerModelToDictionary: [String: Any])
    case login(loginModelToDictionary: [String: Any])
    case updateUser(userId: Int, infoNeedUpdateToDictionary: [String: Any])
    case deleteUser(userId: Int)
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
        case .register:
            return "register"
        case .login:
            return "login"
        case .updateUser(let userId, _):
            return "users/\(userId)"
        case .deleteUser(let userId):
            return "users/\(userId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .users,
             .detailUser:
            return .get
        case .register,
             .login:
            return .post
        case .updateUser:
            return .put
        case .deleteUser:
            return .delete
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .users, .detailUser: // Send no parameters
            return .requestPlain
        case .register(let registerModelToDictionary):
            return .requestParameters(parameters: registerModelToDictionary, encoding: JSONEncoding.default)
        case .login(let loginModelToDictionary):
            return .requestParameters(parameters: loginModelToDictionary, encoding: JSONEncoding.default)
        case .updateUser( _, let infoNeedUpdateToDictionary):
            return .requestParameters(parameters: infoNeedUpdateToDictionary, encoding: JSONEncoding.default)
        case .deleteUser:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    // stuff
}
