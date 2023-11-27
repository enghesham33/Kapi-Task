//
//  RegisterViewModels.swift
//  Kapi-Task
//
//  Created by Hesham Khaled on 27/11/2023.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerViewModels() {
        autoregister(PostsListViewModel.self, initializer: PostsListViewModel.init)
    }
}

