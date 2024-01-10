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
    var reloadCell: ((Int) -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
    
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    var reloadCell: ((Int) -> Void)?
    var showError: ((String) -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    
    private var articles: [ArticleCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        loadImage(for: row)
        return article
    }
    
    private func loadData() {
        APIManager.getNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.articles = self.convertTOCellViewModel(articles)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
}
    
    private func loadImage(for row: Int) {
        // TODO: Get imageData
        guard let url = URL(string: articles[row].imageUrl),
              let data = try? Data(contentsOf: url)else { return }
        
        articles[row].imageData = data
        reloadCell?(row)
        
    }
    
    private func convertTOCellViewModel(_ articles: [ArticleResponseObject]) -> [ArticleCellViewModel] {
        return articles.map {
            ArticleCellViewModel(article: $0)
        }
    }
    
    private func setupMockObjects() {
        articles = [
            ArticleCellViewModel(article: ArticleResponseObject(title: "First Object Title", description: "First Object Description", urlToImage: "...", date: "25.12.2023"))
        ]
    }
}
