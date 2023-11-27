//
//  Result.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import Alamofire

enum Result<T> {
    
    case success(data: T?)
    case failure(AFError?)
    case loading
}
