//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/17/24.
//

import Foundation

class TechnologyViewModel: NewsListViewModel {
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        
        APIManager.getNews(from: .technology, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}
