//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/6/24.
//

import Foundation

final
class ArticleCellViewModel: TableCollectionViewItemsProtocol {
    let title: String
    let description: String
    let date: String
    let imageUrl: String
    var imageData: Data?
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description ?? ""
        date = article.date
        imageUrl = article.urlToImage ?? ""
    }
}
