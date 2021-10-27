//
//  DetailViewPresenter.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import Foundation

protocol DetailViewPresenterProtocol {
    var model: Model { get }
}


final class DetailViewPresenter: DetailViewPresenterProtocol {
    
    var model: Model
    
    init(model: Model) {
        self.model = model
    }
}
