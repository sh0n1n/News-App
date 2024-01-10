//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by Melkor on 1/6/24.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
