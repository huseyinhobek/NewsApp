//
//  Constant.swift
//  NewsApp
//
//  Created by Hüseyin HÖBEK on 10.11.2022.
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=96b538bb8eb345cea3c341b2ed1af4d8
// "https://newsapi.org/v2/top-headlines?country=tr&apiKey=96b538bb8eb345cea3c341b2ed1af4d8"

// üstteki linkin içinden iki satırı değiştirmek çok mu zor bir dev için.

//

import Foundation

enum NewsAPICall: String{
    private var baseUrl: String {
        "https://newsapi.org/v2"
    }
    private var apiKey: String {
        "96b538bb8eb345cea3c341b2ed1af4d8"
    }
    private var country: String {
        "tr"
    }
    
    case getNews
    
    private var urlString: String {
        switch self {
        case .getNews:
            return "\(baseUrl)/top-headlines?apiKey=\(apiKey)&country=\(country)"
        }
    }
    
    var url: URL{
        switch self {
        case .getNews:
            return URL(string: urlString)!
        }
    }
    
    
    
   // case baseUrl = "https://newsapi.org/v2/top-headlines?country=tr&apiKey="
    // case apiKey = "96b538bb8eb345cea3c341b2ed1af4d8"
        

}

