//
//  ErrorMessage.swift
//  GitHubApp
//
//  Created by OBINNA AGUWA on 30/08/2022.
//

import Foundation

enum GAError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
