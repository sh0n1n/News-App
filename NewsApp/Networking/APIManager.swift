//
//  APIManager.swift
//  NewsApp
//
//  Created by Melkor on 1/9/24.
//

import Foundation

final class APIManager {
    enum Category: String {
        case general = "general"
        case entertainment = "entertainment"
        case technology = "technology"
    }
    
    // MARK: - Propertie
    private static let apiKey = "b9a66c0e7e0f4d58ba808ce8172032c1"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "top-headlines"
    
    // MARK: - Methods
    
    // Create URL Path and make request
    static func getNews(from category: Category, page: Int,searchText: String?, completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
            var searchParameter = ""
            if let searchText = searchText {
                searchParameter = "&q=\(searchText)"
            }
        
            let stringUrl = baseUrl + path + "?category=\(category.rawValue)&language=en&page=\(page)" + searchParameter + "&apiKey=\(apiKey)"
            
            guard let url = URL(string: stringUrl) else { return }
            
            let session = URLSession.shared.dataTask(with: url) { data, _, error in
                handleResponse(data: data,
                               error: error,
                               completion: completion)
            }
            session.resume()
        }
        
    static func getImageData(url: String, completion: @escaping (Result<Data,Error>) -> ()) {
        
        guard let url = URL(string: url) else { return }

        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            }
            if let error = error {
                completion(.failure(error))
            }
        }
            
        session.resume()
    }
        //Handle responce
    private static func handleResponse(data: Data?,
                                        error: Error?,
                                        completion: @escaping (Result<[ArticleResponseObject],Error>) -> ()) {
           
        if let error = error {
            completion(.failure(NetworkingError.networkingError(error)))
        } else if let data = data {
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
            do {
                let model = try JSONDecoder().decode(NewsResponseObject.self, from: data)
                    
                completion(.success(model.articles))
            }
            catch let decodeError {
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetworkingError.unknown))
        }
    }
}
