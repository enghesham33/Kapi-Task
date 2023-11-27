//
//  Post.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import Foundation

struct Post: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    func convertToDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["title"] = title
        dictionary["body"] = body
        dictionary["userId"] = userId
        if let id = id {
            dictionary["id"] = id
        }
        return dictionary
    }
}
