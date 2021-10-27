//
//  Assembler.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import Foundation
import UIKit
class Assembler {
    
    func detailStartViewController(result: Model) -> UIViewController {
        let presenter = DetailViewPresenter(model: result)
        let viewController = DetailViewController(presenter: presenter)
        return viewController
    }
}
