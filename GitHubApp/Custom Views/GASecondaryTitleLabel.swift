//
//  GASecondaryTitleLabel.swift
//  GitHubApp
//
//  Created by Obinna Aguwa on 07/09/2022.
//

import UIKit

class GASecondaryTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(customFontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: customFontSize, weight: .medium)
        configure()
    }
    
    private func configure() {
        textColor                    = .secondaryLabel
        adjustsFontSizeToFitWidth    = true
        minimumScaleFactor           = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
