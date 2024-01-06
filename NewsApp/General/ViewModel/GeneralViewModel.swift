//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/6/24.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set}
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    
    private var articles: [ArticleResponseObject] = []
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        return ArticleCellViewModel(article: article)
    }
    
    private func loadData() {
     // TODO: - Load Data
        
    }
}
