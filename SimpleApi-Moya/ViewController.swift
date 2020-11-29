//
//  ViewController.swift
//  SimpleApi-Moya
//
//  Created by HongNhan on 11/27/20.
//

import UIKit
import Moya

class ViewController: UIViewController {

    let provider = MoyaProvider<MyServiceApi>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: - Document:
        //...
    }

    //MARK: - User Api
    @IBAction func getUsersDidTap(_ sender: Any) {
        provider.request(.users(page: 2)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try response.map(ResponseUsers<UserStructModel>.self).data
                    
                    print("usercount=", results.count)
                    print("user0=", results[0])
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    @IBAction func getDetailUserDidTap(_ sender: Any) {
        provider.request(.detailUser(id: 2)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try response.map(ResponseUser<UserStructModel>.self).data

                    print("userdetailid=", result.id)
                    print(result.formatToJsonString(options: .prettyPrinted))
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    @IBAction func postRegisterDidTap(_ sender: Any) {
    }
    
    @IBAction func postLoginDidTap(_ sender: Any) {
    }
    
    @IBAction func podUpdateUserInfoDidTap(_ sender: Any) {
    }
    
    @IBAction func deleteUserDidTap(_ sender: Any) {
    }
    
}

