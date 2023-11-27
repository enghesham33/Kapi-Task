//
//  BaseView.swift
//  Kapi-Task
//
//  Created by Hesham Donia on 27/11/2023.
//

import Foundation

protocol BaseView {
    func showLoader()
    func hideLoader()
    func showErrorMessage(errorMessage: String?)
}
