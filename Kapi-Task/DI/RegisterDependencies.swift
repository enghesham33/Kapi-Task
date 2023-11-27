//
//  Container+RegisterDependencies.swift
//  Kapi-Task
//
//  Created by Hesham Khaled on 27/11/2023.
//

import Foundation
import Swinject

extension Container {
    func registerDependencies() {
        registerViews()
        registerViewModels()
        registerRepositories()
    }
}
