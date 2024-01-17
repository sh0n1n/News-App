//
//  SpaceViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/14/24.
//

import Foundation

final class EntertainmentViewModel: NewsListViewModel {
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        
        APIManager.getNews(from: .entertainment, page: page, searchText: searchText) { [weak self ] result in
            self?.handleResult(result)
        }
    }
    
    override func convertToCellViewModel(_ articles: [ArticleResponseObject]) {
        var viewModels = articles.map { ArticleCellViewModel(article: $0)}
    
        if sections.isEmpty {
            let firstSection = TableCollectionViewSection(items: [viewModels.removeFirst()])
            let secondSection = TableCollectionViewSection(items: viewModels)
            sections = [firstSection, secondSection]
        } else {
            sections[1].items += viewModels
        }
    }
}
