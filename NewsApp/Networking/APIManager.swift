//
//  APIManager.swift
//  NewsApp
//
//  Created by Melkor on 1/9/24.
//

import Foundation

final class APIManager {
    private static let apiKey = ""
    private static let baseUrl = "GET https://newsapi.org/v2/"
    private static let path = "everything"
    
    // Create URL Path and make request
    static func getNews(completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=nasa&language=en" + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data, error: error, completion)
        }
        
        session.resume()
    }
    
    // Handle response
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        if let error = error {
            
        } else if let data = data {
            
        } else {
            
        }
    }
}
