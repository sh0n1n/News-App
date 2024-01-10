//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/6/24.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description
        date = article.date
    }
}
