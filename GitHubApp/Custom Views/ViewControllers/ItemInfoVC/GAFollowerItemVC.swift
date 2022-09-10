//
//  GAFollowerItemVC.swift
//  GitHubApp
//
//  Created by OBINNA AGUWA on 10/09/2022.
//

import UIKit

class GAFollowerItemVC: GAItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
}
