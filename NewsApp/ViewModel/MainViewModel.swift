//
//  MainViewModel.swift
//  NewsApp
//
//  Created by Hüseyin HÖBEK on 13.11.2022.
//

import Foundation



final class MainViewModel {
    
    var articleList = [Article]()
    private let webService: MainWebServiceAdapter
    
    init(webService: MainWebServiceAdapter) {
        self.webService = webService
    } 
    
    func getNews(completionHandler: @escaping () -> Void) {
        webService.getNews { result in
            switch result {
            case .success(let response):
                if let articles = response.articles {
                    self.articleList = articles
                }
                completionHandler()
            case .failure(let error):
                print(error)
            }
        }
    }
}
