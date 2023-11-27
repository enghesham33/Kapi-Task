//
//  FormViewController.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import UIKit

class FormViewController: BaseViewController {

    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var actionButton: UIButton!
    
    var viewModel: FormViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showScreenDefaultData()
    }
    
    private func showScreenDefaultData() {
        screenTitleLabel.text = viewModel?.getScreenTitle()
        titleTextView.text = viewModel?.post?.title ?? postTitlePlaceholder
        bodyTextView.text = viewModel?.post?.body ?? postBodyPlaceholder
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        MainCoordinator.shared?.pop()
    }
    
    @IBAction func actionButtonClicked(_ sender: Any) {
        if viewModel?.validate(title: titleTextView.text, body: bodyTextView.text) ?? false {
            viewModel?.submit(title: titleTextView.text, body: bodyTextView.text)
        } else {
            showErrorMessage(errorMessage: "Please fill empty fields")
        }
    }
}


