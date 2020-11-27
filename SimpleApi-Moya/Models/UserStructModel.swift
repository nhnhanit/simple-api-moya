//
//  UserStructModel.swift
//  SimpleApi-Moya
//
//  Created by HongNhan on 11/27/20.
//
/*
 {
 "id": 1,
 "name": "Leanne Graham",
 "username": "Bret",
 "email": "Sincere@april.biz",
 "address": {
 "street": "Kulas Light",
 "suite": "Apt. 556",
 "city": "Gwenborough",
 "zipcode": "92998-3874",
 "geo": {
 "lat": "-37.3159",
 "lng": "81.1496"
 }
 },
 "phone": "1-770-736-8031 x56442",
 "website": "hildegard.org",
 "company": {
 "name": "Romaguera-Crona",
 "catchPhrase": "Multi-layered client-server neural-net",
 "bs": "harness real-time e-markets"
 }
 },
 */
import Foundation

struct UserStructModel: Codable {
    let id: Int
    let name: String?
    let username: String?
    let email: String?
    let address: Address
    let phone: String?
    let website: String?
    let company: Company
    let acb: String? // prints:  abc nil
//    let acb: String // prints:  Swift.DecodingError.keyNotFound(CodingKeys(stringValue: "acb", intValue: nil)
}

extension UserStructModel: CustomDebugStringConvertible {
    var debugDescription: String {
        return "<User ID:\(id)> \n \(name ?? "") with \n username \(username ?? "") \n addresscity \(address.city ?? "") \n companyname \(company.name ?? "") \n abc \(acb ?? "")"
    }
}
extension UserStructModel {
    struct Address: Codable {
        let street: String?
        let suite: String?
        let city: String?
        let zipcode: String?
        let geo: Geo
    }
    
    struct Geo: Codable {
        let lat: String?
        let lng: String
    }
}
extension UserStructModel {
    struct Company: Codable {
        let name: String?
        let catchPhrase: String?
        let bs: String?
    }
}
