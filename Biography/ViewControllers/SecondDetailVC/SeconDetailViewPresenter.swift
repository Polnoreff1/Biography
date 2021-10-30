//
//  SeconDetailViewPresenter.swift
//  Biography
//
//  Created by Андрей  on 30.10.2021.
//

import Foundation

protocol SeconDetailViewPresenterProtocol {
    var model: Result { get }
}

class SeconDetailViewPresenter: SeconDetailViewPresenterProtocol {
    
    var model: Result
    
    init(model: Result) {
        self.model = model
    }
    
    
}
