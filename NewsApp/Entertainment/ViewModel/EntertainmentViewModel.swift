//
//  SpaceViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/14/24.
//

import Foundation

protocol EntertainmentViewModelProtocol {
    var reloadData: (() -> Void)? { get set}
    var showError: ((String) -> Void)? { get set}
    var reloadCell: ((Int) -> Void)? { get set }
    var articles: [TableCollectionViewSection] { get }
        
    func loadData()
}

final class EntertainmentViewModel: EntertainmentViewModelProtocol {
    var reloadData: (() -> Void)?
    var reloadCell: ((Int) -> Void)?
    var showError: ((String) -> Void)?
    
    // MARK: - Properties
    private(set) var articles: [TableCollectionViewSection] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    func loadData() {
        print(#function)
        
        APIManager.getNews(from: .entertainment) { [weak self ] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let articles):
                self.articles = self.convertToCellViewModel(articles)
                self.loadImage()
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func loadImage() {
        for (index,article) in articles.enumerated() {
            guard let url = article.imageUrl else { return }
            APIManager.getImageData(url: url) { [weak self] result in
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self?.articles[index].imageData = data
                        self?.reloadCell?(index)
                    case .failure(let error):
                        self?.showError?(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    private func convertToCellViewModel(_ articles: [ArticleResponseObject]) {
        var viewModels = articles.map { ArticleCellViewModel(article: $0)}
        let firstSection = TableCollectionViewSection(items: [viewModels.removeFirst()])
        let secondSection = TableCollectionViewSection(items: viewModels)
        self.articles = [firstSection, secondSection]
    }
    
    private func setupMockObjects() {
        articles = [
            TableCollectionViewSection(items:[ArticleCellViewModel(article: ArticleResponseObject(title: "First", description: "First descriptio", urlToImage: "...", date: "25.12.2023"))])
        ]
    }
}
