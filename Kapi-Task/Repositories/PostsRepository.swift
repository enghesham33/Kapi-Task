//
//  PostsRepository.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import Foundation
import Alamofire

protocol PostsRepository {
    func getPostsList(completion: @escaping (Result<[Post]>) -> Void)
}

class PostsRepositoryImpl: PostsRepository {
    func getPostsList(completion: @escaping (Result<[Post]>) -> Void) {
        completion(.loading)
        AF.request(URL(string: posts)!, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseDecodable(of: [Post].self) { response in
                switch response.result {
                case .success(let res):
                    completion(.success(data: res))
                    break
                    
                case .failure(let error):
                    completion(.failure(error))
                    break
                }
            }
    }
}
