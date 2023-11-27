//
//  Coordinator.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import Foundation
import UIKit

enum Destination {
    case PostsList
    case Form(action: FormScreenAction, post: Post?, view: FormView?)
}

protocol Coordinator {
    var navigationController: UINavigationController { get set }
   
    func pop()
    func push(destination : Destination)
}
