//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/10/24.
//

import Foundation

protocol NewsViewModelProtocol {
    var title: String { get }
    var descriptioon: String { get }
    var date: String { get }
    var imageData: Data? { get }
}

final class NewsViewModel: NewsViewModelProtocol {
    let title: String
    let descriptioon: String
    let date: String
    let imageData: Data?
    
    init(article: ArticleCellViewModel) {
        title = article.title
        descriptioon = article.description
        date = article.date
        imageData = article.imageData
    }
}
