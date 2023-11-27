//
//  PostsListViewController.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import UIKit

class PostsListViewController: BaseViewController {
    
    var viewModel: PostsListViewModel?
    
    @IBOutlet weak var postsTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "PostCell", bundle: nil)
            postsTableView.register(nib, forCellReuseIdentifier: "PostCell")
            
            postsTableView.dataSource = self
            postsTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.getPostsList()
    }
    
    @IBAction func createPostButtonPressed(_ sender: Any) {
        MainCoordinator.shared?.push(destination: .Form(action: .Create, post: nil, view: self))
    }
}

extension PostsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count ----------------------- \(viewModel?.postsList.count ?? 0)")
        return viewModel?.postsList.count ?? 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.post = viewModel?.postsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MainCoordinator.shared?.push(destination: .Form(action: .Update, post: viewModel?.postsList[indexPath.row], view: self))
    }
    
}

extension PostsListViewController: PostsListView {
    func showPosts() {
        postsTableView.reloadData()
    }
}

extension PostsListViewController: FormView {
    func postCreatedSuccessfully(post: Post?) {
        if let post = post {
            viewModel?.postsList.append(post)
            postsTableView.reloadData()
            if let count = viewModel?.postsList.count, count > 0 {
                postsTableView.scrollToRow(at: IndexPath(row: count - 1, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    func postUpdatedSuccessfully(post: Post?) {
        if let post = post {
            if let index = viewModel?.postsList.firstIndex(where: { currentPost in
                post.id == currentPost.id
            }) {
                viewModel?.postsList[index] = post
                postsTableView.reloadData()
                postsTableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .bottom, animated: true)
            }
            
            
        }
    }
}
