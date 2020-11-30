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
//{"id":1,"name":"cerulean","year":2000,"color":"#98B2D1","pantone_value":"15-4020"
//{"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"}}

struct UserStructModel: Codable {
    let id: Int
    let name: String?
    let year: Int?
    let color: String?
    let pantoneValue: String?
    let email: String?
    let firstName: String?
    let lastName: String?
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case year
        case color
        case pantoneValue = "pantone_value"
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
}
extension UserStructModel: CustomDebugStringConvertible {
    var debugDescription: String {
        return "<User ID:\(id)> \n \(name ?? ""))"
    }
    var fullName: String {
        return "\(firstName ?? "") \(lastName ?? "")"
    }
}
