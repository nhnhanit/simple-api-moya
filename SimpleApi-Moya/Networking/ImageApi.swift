//
//  ImageApi.swift
//  SimpleApi-Moya
//
//  Created by HongNhan on 11/30/20.
//

import Foundation
import Moya

let imageProvider = MoyaProvider<ImageApi>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])

enum ImageApi {
    case upload(imageData: Data)
}
extension ImageApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://sample.com") else {
            fatalError("baseURL could not be configured.")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .upload:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .upload:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .upload(let imageData):
            return .uploadMultipart([MultipartFormData(provider: .data(imageData), name: "image", fileName: "filename.jpg", mimeType: "image/jpg")])
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    // stuff
}
