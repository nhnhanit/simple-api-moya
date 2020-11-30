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
        let provider1 = MoyaProvider<MultiTarget>()
        provider1.request(MultiTarget(MyServiceApi.users(page: 2))) { result in
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
                    
                    print(result.fullName)
                    
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    @IBAction func postRegisterDidTap(_ sender: Any) {
        let regis = RegisterStructModel(email: "abc@gmail.com", password: "qwerty1")
        
        provider.request(.register(registerModelToDictionary: regis.formatToJsonDictionary())) { result in
            //print("\(result)")
            switch result {
            case let .success(response):
                do {
                    if let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] {
                            print("responejsonObject=", json)
                        }
                    
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    @IBAction func postLoginDidTap(_ sender: Any) {
        
        // Note: can test with api:
//        guard let url = URL(string: "https://123xyz/api/v1/") else {
//            fatalError("baseURL could not be configured.")
//        }
        
        let loginInfo = ["email": "eve.holt@reqres.in", "password": "cityslicka"]
        
        provider.request(.login(loginModelToDictionary: loginInfo)) { result in
            //print("\(result)")
            switch result {
            case let .success(response):
                do {
                    if let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] {
                            print("responejsonObject=", json)
                        }
                    
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    @IBAction func podUpdateUserInfoDidTap(_ sender: Any) {
        
        let infoNeedUpdateDic = ["name": "acb", "job": "developer"]
        
        provider.request(.updateUser(userId: 2, infoNeedUpdateToDictionary: infoNeedUpdateDic)) { result in
            //print("\(result)")
            switch result {
            case let .success(response):
                do {
                    if let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] {
                            print("responejsonObject=", json)
                        }
                    
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
    @IBAction func deleteUserDidTap(_ sender: Any) {
        provider.request(.deleteUser(userId: 2)) { result in
            //print("\(result)")
            switch result {
            case let .success(response):
                do {
                    // status code 204, response empty
                    if let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] {
                        print("responejsonObject=", json)
                    }
                    
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    @IBAction func uploadButtonDidTap(_ sender: Any) {
        
        let provider2 = MoyaProvider<ImageApi>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])
        
        let image = UIImage(named: "image1.png")
        guard let imageData = image?.jpegData(compressionQuality: 1.0) else {
            return
        }
        
        provider2.request(.upload(imageData: imageData)) { result in
            //print("\(result)")
            switch result {
            case let .success(response):
                do {
                    // status code 204, response empty
                    if let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] {
                        print("responejsonObject=", json)
                    }
                    
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}

