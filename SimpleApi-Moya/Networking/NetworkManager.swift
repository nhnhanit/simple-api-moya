//
//  NetworkManager.swift
//  SimpleApi-Moya
//
//  Created by HongNhan on 11/27/20.
//

import Foundation
import Moya

protocol Networkable {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

struct NetworkManager: Networkable {
    
    static let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
    static let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
    //let provider = MoyaProvider<UserApi>(plugins: [networkLogger])
    let provider = MoyaProvider<UserApi>()
    
    
    func getUsers(completion: @escaping ([UserStructModel])->()){
        provider.request(.users) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([UserStructModel].self, from: response.data)
                    //let results = try response.map([UserStructModel].self)
                    
                    completion(results)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getDetailUser(id: Int, completion: @escaping (UserStructModel)->()){
        provider.request(.detailUser(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    //let result = try JSONDecoder().decode(UserStructModel.self, from: response.data)
                    let result = try response.map(UserStructModel.self)
                    
                    completion(result)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

