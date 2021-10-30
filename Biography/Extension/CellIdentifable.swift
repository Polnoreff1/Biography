//
//  CellIdentifiable.swift
//  Water Project
//
//  Created by Yura Yatseyko on 17.10.2021.
//

import UIKit

protocol CellIdentifiable {
    
    static var identifier: String { get }
    
    static var nib: UINib { get }
}

extension CellIdentifiable where Self: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}

extension CellIdentifiable where Self: UITableViewCell {
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}

extension CellIdentifiable where Self: UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
