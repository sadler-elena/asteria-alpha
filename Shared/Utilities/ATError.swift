//
//  ATError.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/14/21.
//

import Foundation

enum ATError: String, Error {
    case invalidCity = "The city entered created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data recieved from the server was invalid. Please try again."
}
