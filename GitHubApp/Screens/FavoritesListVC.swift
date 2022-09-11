//
//  FavoritesListVC.swift
//  GitHubApp
//
//  Created by OBINNA AGUWA on 27/08/2022.
//

import UIKit

class FavoritesListVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavorites { [weak self] result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    
}
