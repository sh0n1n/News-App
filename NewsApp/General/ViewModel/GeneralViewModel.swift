//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/6/24.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
    
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    
    private var articles: [ArticleResponseObject] = [] {
        didSet {
            reloadData?()
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        return ArticleCellViewModel(article: article)
    }
    
    private func loadData() {
        APIManager.getNews { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
            case .failure(let error):
                self?.showError?(error.localizedDescription)
            }
        }
}
    
    private func setupMockObjects() {
        articles = [
            ArticleResponseObject(title: "First Object Titl", description: "First Object Description", urlToImage: "...", date: "31.12.2023"),
            ArticleResponseObject(title: "Second Object Titl", description: "Second Object Description", urlToImage: "...", date: "01.01.2024"),
            ArticleResponseObject(title: "Third Object Titl", description: "Third Object Description", urlToImage: "...", date: "02.01.2024"),
            ArticleResponseObject(title: "Fourth Object Titl", description: "Fourth Object Description", urlToImage: "...", date: "03.01.2024"),
        ]
    }
}
