//
//  DetailViewController.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import UIKit

class DetailViewController: UIViewController {

    private let presenter: DetailViewPresenterProtocol

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    
    
    init(presenter: DetailViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "screenCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "screenCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.model.screenshoot.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenCell", for: indexPath) as! DetailCollectionViewCell
        cell.cellImage.image = UIImage(named: presenter.model.screenshoot[indexPath.row])

        return cell
    }
    
    
    
    
    
}
