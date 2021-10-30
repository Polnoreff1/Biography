//
//  SeconDetailViewController.swift
//  Biography
//
//  Created by Андрей  on 30.10.2021.
//

import UIKit

class SeconDetailViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var resultLabel: UITextView!
    
    //MARK: - Property
    private let presenter: SeconDetailViewPresenter
    
    //MARK: - Init
    init(presenter: SeconDetailViewPresenter ) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(presenter.model.title ?? "") + \(presenter.model.publishedDate ?? "")"
    }
}
