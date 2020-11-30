//
//  Decodable+Etx.swift
//  SimpleApi-Moya
//
//  Created by HongNhan on 11/27/20.
//

import Foundation

extension Decodable where Self : Encodable {
    
    dynamic func formatToJsonString(options: JSONEncoder.OutputFormatting) -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = options
        
        do {
            let jsonData = try encoder.encode(self)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return "\(jsonString)"
            }
        } catch {
            print("\(error.localizedDescription)")
        }
        return "nil"
    }
    
    // format a StructModelCodable to Dictionary, for POST API such as: register, login
    dynamic func formatToJsonDictionary() -> [String: Any] {
        do {
            let jsonData = try JSONEncoder().encode(self)
            if let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
                return dictionary
            } else {
                return ["": ""]
            }
        } catch {
            print("\(error.localizedDescription)")
        }
        return ["": ""]
    }
    
}
