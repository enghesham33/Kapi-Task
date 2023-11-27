//
//  BaseRepository.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import Foundation
import Alamofire

class BaseRepository {
    func getHeaders() -> HTTPHeaders {
        return HTTPHeaders(["Content-type" : "application/json", "charset" : "UTF-8"])
    }
}
