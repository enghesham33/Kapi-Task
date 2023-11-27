//
//  FormViewModel.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import Foundation

protocol FormView: BaseView {
    func postCreatedSuccessfully(post: Post?)
    func postUpdatedSuccessfully(post: Post?)
}

class FormViewModel {
    
    var repository: PostsRepository?
    var view: FormView?
    var action: FormScreenAction?
    var post: Post?
    
    init(repository: PostsRepository?) {
        self.repository = repository
    }
    
    func getScreenTitle() -> String {
        switch action {
        case .Create:
            return "Create Post"
            
        case .Update:
            return "Edit Post"
            
        default:
            return ""
        }
    }
    
    func validate(title: String?, body: String?) -> Bool {
        return !((title?.isEmpty ?? true) || title == postTitlePlaceholder || (body?.isEmpty ?? true) || body == postBodyPlaceholder)
    }
    
    func submit(title: String?, body: String?) {
        switch action {
        case .Create:
            let post = Post(userId: 1, title: title, body: body)
            repository?.createPost(post: post, completion: { [weak self] result in
                switch result {
                case .success(let data):
                    self?.view?.hideLoader()
                    self?.view?.postCreatedSuccessfully(post: data)
                    MainCoordinator.shared?.pop()
                    break
                case .failure(let error):
                    self?.view?.hideLoader()
                    self?.view?.showErrorMessage(errorMessage: error?.localizedDescription)
                    break
                case .loading:
                    self?.view?.showLoader()
                    break
                }
            })
            
        case .Update:
            if let _ = post {
                self.post?.title = title
                self.post?.body = body
                repository?.updatePost(post: post!, completion: { [weak self] result in
                    switch result {
                    case .success(let data):
                        self?.view?.hideLoader()
                        self?.view?.postUpdatedSuccessfully(post: data)
                        MainCoordinator.shared?.pop()
                        break
                    case .failure(let error):
                        self?.view?.hideLoader()
                        self?.view?.showErrorMessage(errorMessage: error?.localizedDescription)
                        break
                    case .loading:
                        self?.view?.showLoader()
                        break
                    }
                })
            }
            
        default:
            break
        }
    }
    
}

public enum FormScreenAction {
    case Create
    case Update
}
