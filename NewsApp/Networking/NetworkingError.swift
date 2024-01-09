//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Melkor on 1/9/24.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
