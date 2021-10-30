//
//  NetworkService.swift
//  Biography
//
//  Created by Андрей  on 30.10.2021.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func getNews(filterType: String, completion: @escaping Closure1<News>)
}

class NetworkService: NetworkServiceProtocol {
   
    func getNews(filterType: String, completion: @escaping Closure1<News>) {

        let urlParams = [
            "api-key": "mQJEBFlyWjqfo0ArkXlFsOLtwuShX9EB"
        ]

        guard let url = URL(string: APIEndpoint.baseURL + filterType) else { return }

        AF.request(url, parameters: urlParams).validate().responseJSON { (response) in

            switch response.result {
            case .success(_):
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let news: News = try JSONDecoder().decode(News.self, from: data)
                    completion(news)
                } catch {
                    print(error.localizedDescription)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
