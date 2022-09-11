//
//  Date+Ext.swift
//  GitHubApp
//
//  Created by OBINNA AGUWA on 10/09/2022.
//

import UIKit

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
