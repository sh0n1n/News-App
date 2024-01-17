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
    var date: String
    let imageUrl: String?
    var imageData: Data?
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description ?? ""
        date = article.date
        imageUrl = article.urlToImage ?? ""
        
        if let formatDate = formatDate(dateString: self.date) {
            self.date = formatDate
        }
    }
    
    private func formatDate(dateString: String) -> String? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormater.date(from: dateString) else { return nil }
        
        dateFormater.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormater.string(from: date)
    }
}
