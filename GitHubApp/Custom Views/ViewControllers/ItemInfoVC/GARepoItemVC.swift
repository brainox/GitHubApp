//
//  GARepoItemVC.swift
//  GitHubApp
//
//  Created by OBINNA AGUWA on 10/09/2022.
//

import UIKit

class GARepoItemVC: GAItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
}
