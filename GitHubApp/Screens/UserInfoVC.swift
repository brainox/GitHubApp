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
    let dateLabel           = GABodyLabel(textAlignment: .center)
    
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
                    self.dateLabel.text = "Github since \(user.createdAt.convertToDisplayFormat())"
                }
            case .failure(let error):
                self.presentGAAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "ok")
            }
        }
    }
    
    func layoutUI() {
        
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
        
        view.addSubview(headerView)
        [headerView, itemViewOne, itemViewTwo, dateLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
      
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
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
