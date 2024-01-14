//
//  ArticleResponseObject.swift
//  NewsApp
//
//  Created by Melkor on 1/6/24.
//

import Foundation

struct ArticleResponseObject: Codable {
    let title: String
    let description: String?
    let urlToImage: String?
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case date = "publishedAt"
    }
}
