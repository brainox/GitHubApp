//
//  UserInfoVC.swift
//  GitHubApp
//
//  Created by Obinna Aguwa on 07/09/2022.
//

import UIKit

class UserInfoVC: UIViewController {
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUsers(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print("User is \(user)")
            case .failure(let error):
                self.presentGAAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "ok")
            }
        }
        
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
