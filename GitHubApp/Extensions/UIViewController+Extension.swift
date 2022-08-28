//
//  UIViewController+Extension.swift
//  GitHubApp
//
//  Created by Obinna Aguwa on 27/08/2022.
//

import UIKit

extension UIViewController {
    func presentGAAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GAAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
