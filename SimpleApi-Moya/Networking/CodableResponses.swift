import Foundation

struct ResponseUsers<T: Codable>: Codable {
    let data: [T]
}

struct ResponseUser<T: Codable>: Codable {
    let data: T
}
