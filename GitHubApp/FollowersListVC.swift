//
//  FollowersListVC.swift
//  GitHubApp
//
//  Created by Obinna Aguwa on 27/08/2022.
//

import UIKit

class FollowersListVC: UIViewController {
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden             = false
        navigationController?.navigationBar.prefersLargeTitles   = true
    }
}
