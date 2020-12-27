//
//  ViewController.swift
//  SimpleApi-Moya
//
//  Created by HongNhan on 11/27/20.
//

import UIKit

class ViewController: UIViewController {

    
    let provider = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: - Document:
        //...
    }

    //MARK: - User Api
    @IBAction func getUsersDidTap(_ sender: Any) {
//        provider.getUsers { (users) in
//            print("usercount=", users.count)
//            print("usercount=", users[0])
//        }
        
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        queue.sync {
            for _ in 1...100 {
                print("thread 1")
            }
        }

        queue.async {
            for _ in 1...100 {
                print("thread 2")
            }
        }
    }
    
    @IBAction func getDetailUserDidTap(_ sender: Any) {
        provider.getDetailUser(id: 1) { (detailUser) in
            
            print("detailuser=", detailUser.debugDescription)
            
            //print("formatToJsonString", detailUser.formatToJsonString(options: .sortedKeys))
            print("formatToJsonString", detailUser.formatToJsonString(options: .prettyPrinted))
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

