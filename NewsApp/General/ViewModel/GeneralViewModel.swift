//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/6/24.
//

import Foundation

final class GeneralViewModel: NewsListViewModel {
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        
        APIManager.getNews(from: .general, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}


