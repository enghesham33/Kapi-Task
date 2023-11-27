//
//  RegisterRepositories.swift
//  Kapi-Task
//
//  Created by Hesham Khaled on 27/11/2023.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerRepositories() {
        autoregister(PostsRepository.self, initializer: PostsRepositoryImpl.init)        
    }
}

