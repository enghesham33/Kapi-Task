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
    
}

extension PostsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.postsList.count ?? 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.post = viewModel?.postsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked post title is \(viewModel?.postsList[indexPath.row].title ?? "")")
    }
    
}

extension PostsListViewController: PostsListView {
    func showPosts() {
        postsTableView.reloadData()
    }
}
