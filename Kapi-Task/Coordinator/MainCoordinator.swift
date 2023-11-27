//
//  MainCoordinator.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    static var shared : MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    
    func push(destination: Destination) {
        switch destination {
        case .PostsList:
            let vc = PostsListViewController(nibName: "PostsListViewController", bundle: nil)
            vc.viewModel = AppDelegate.container.resolve(PostsListViewModel.self)
            vc.viewModel?.view = vc
            self.navigationController.pushViewController(vc, animated: true)
            break
            
        case .Form(let action, let post, let view):
            let vc = FormViewController(nibName: "FormViewController", bundle: nil)
            vc.viewModel = AppDelegate.container.resolve(FormViewModel.self)
            vc.viewModel?.view = view
            vc.viewModel?.action = action
            vc.viewModel?.post = post
            self.navigationController.pushViewController(vc, animated: true)
            break
        }
    }
}
