//
//  StartViewPresenter.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import Foundation
import UIKit

protocol StartViewPresenterProtocol {
    func pushToDetailVC(view: UIViewController, result: Model)
}


final class StartViewPresenter: StartViewPresenterProtocol {
    
    private let navigator: Navigator
    
    init(navigator: Navigator) {
        self.navigator = navigator
    }
    
}

// MARK: - Private Extension
extension StartViewPresenter {
    func pushToDetailVC(view: UIViewController, result: Model) {
                navigator.pushStartDetailVC(from: view, result: result)
            }

}
