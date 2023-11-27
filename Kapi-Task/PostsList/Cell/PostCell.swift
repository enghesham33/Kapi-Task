//
//  PostCell.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    
    var post: Post? {
        didSet {
            if let post = post {
                postTitleLabel.text = post.title
                postBodyLabel.text = post.body
            }
        }
    }
    
}
