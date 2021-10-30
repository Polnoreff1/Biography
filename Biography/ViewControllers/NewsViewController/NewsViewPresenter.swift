//
//  NewsViewPresenter.swift
//  Biography
//
//  Created by Андрей  on 30.10.2021.
//

import UIKit
protocol NewsViewPresenterProtocol {
   
    func getNews(period: Int, completion: @escaping Closure1<[Result]?>)
    
    func pushToDetailVC(view: UIViewController, result: Result)
    
}


final class NewsViewPresenter: NewsViewPresenterProtocol {
    
    private let navigator: Navigator
    private let networkService: NetworkService
    
    init(navigator: Navigator, networkService: NetworkService) {
        self.navigator = navigator
        self.networkService = networkService
    }
    
}

// MARK: - Private Extension
extension NewsViewPresenter {
    func getNews(period: Int, completion: @escaping Closure1<[Result]?>) {
        networkService.getNews(filterType: APIEndpoint.getSharedNews(period).stringValue) { news in
            completion(news.results)
        }
    }
}

// MARK: - Rounting
extension NewsViewPresenter {
    func pushToDetailVC(view: UIViewController, result: Result) {
        navigator.pushSecondDetailVC(from: view, result: result)
    }
}
