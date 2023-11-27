//
//  PostsListViewModel.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

protocol PostsListView: BaseView {
    func showPosts()
}

class PostsListViewModel {
    
    var repository: PostsRepository?
    var view: PostsListView?
    
    var postsList = [Post]()
    
    init(repository: PostsRepository?) {
        self.repository = repository
    }
    
    func getPostsList() {
        
        repository?.getPostsList(completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.view?.hideLoader()
                self?.postsList = data ?? []
                self?.view?.showPosts()
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
}
