//
//  FormViewController.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import UIKit

class FormViewController: BaseViewController {

    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var titleTextView: UITextView! {
        didSet {
            titleTextView.delegate = self
        }
    }
    @IBOutlet weak var bodyTextView: UITextView! {
        didSet {
            bodyTextView.delegate = self
        }
    }
    @IBOutlet weak var actionButton: UIButton!
    
    var viewModel: FormViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showScreenDefaultData()
    }
    
    private func showScreenDefaultData() {
        screenTitleLabel.text = viewModel?.getScreenTitle()
        titleTextView.text = viewModel?.post?.title ?? postTitlePlaceholder
        titleTextView.textColor = viewModel?.post == nil ? .lightGray : .black
        bodyTextView.text = viewModel?.post?.body ?? postBodyPlaceholder
        bodyTextView.textColor = viewModel?.post == nil ? .lightGray : .black
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

extension FormViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = textView == titleTextView ? postTitlePlaceholder : postBodyPlaceholder
            textView.textColor = UIColor.lightGray
        }
    }
}




