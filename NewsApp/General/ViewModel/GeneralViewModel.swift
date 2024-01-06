//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Melkor on 1/6/24.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set}
    var articles: [ArticleResponseObject] { get set}
}

final class GeneralViewModel: GeneralViewModelProtocol {
    // MARK: - Properties
    var articles: [ArticleResponseObject] = []
    
    init() {
        loadData()
    }
    
    private func loadData() {
     // TODO: - Load Data
        
    }
}
