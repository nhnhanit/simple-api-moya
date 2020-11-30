//
//  LoginStructModel.swift
//  SimpleApi-Moya
//
//  Created by HongNhan on 11/30/20.
//

import Foundation

struct LoginStructModel: Codable {
    let email: String?
    let password: String?
    let isEncrypted: Bool
}
