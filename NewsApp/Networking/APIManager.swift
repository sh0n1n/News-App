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
    
    static func getNews(completion: @escaping ([ArticleResponseObject]) -> ()) {
        let stringUrl = baseUrl + path + "?sources=nasa&language=en" + "&apiKey=\(apiKey)"
        
        let url = URL(string: stringUrl)
    }
}
