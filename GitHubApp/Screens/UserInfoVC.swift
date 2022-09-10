//
//  UserInfoVC.swift
//  GitHubApp
//
//  Created by Obinna Aguwa on 07/09/2022.
//

import UIKit

class UserInfoVC: UIViewController {
    let headerView          = UIView()
    let itemViewOne         = UIView()
    let itemViewTwo         = UIView()
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        layoutUI()
        getUserInfo()
    }
    
    fileprivate func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    fileprivate func getUserInfo() {
        NetworkManager.shared.getUsers(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: GAUserInfoHeaderVC(user: user), to: self.headerView)
                    self.add(childVC: GARepoItemVC(user: user), to: self.itemViewOne)
                    self.add(childVC: GAFollowerItemVC(user: user), to: self.itemViewTwo)
                }
            case .failure(let error):
                self.presentGAAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "ok")
            }
        }
    }
    
    func layoutUI() {
        view.addSubview(headerView)
        [headerView, itemViewOne, itemViewTwo].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        
        let padding: CGFloat    = 20
        let itemHeight: CGFloat          = 140
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame      = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
