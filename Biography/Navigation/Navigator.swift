//
//  Navigator.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    
}

class Navigator: NavigatorProtocol {
    
    var appAssembly = Assembler()
    
    func pushStartDetailVC(from viewController: UIViewController, result: Model) {
        let vc = appAssembly.detailStartViewController(result: result)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushSecondDetailVC(from viewController: UIViewController, result: Result) {
        let vc = appAssembly.secondDetailVC(result: result)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
}

