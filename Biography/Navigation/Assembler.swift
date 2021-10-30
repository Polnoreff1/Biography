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
    
    func secondDetailVC(result: Result) -> UIViewController {
        let presenter = SeconDetailViewPresenter(model: result)
        let vc = SeconDetailViewController(presenter: presenter)
        return vc
    }
    
}
