//
//  BaseViewController.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import UIKit
import SwiftLoader

class BaseViewController: UIViewController {
        
    func showLoader() {
        SwiftLoader.show(title: "Loading...", animated: true)
    }
    
    func hideLoader() {
        SwiftLoader.hide()
    }
    
    func showErrorMessage(errorMessage: String?) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        present(alert, animated: true)
    }
}
