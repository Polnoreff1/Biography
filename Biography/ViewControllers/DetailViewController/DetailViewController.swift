//
//  DetailViewController.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import UIKit

class DetailViewController: UIViewController {

    private let presenter: DetailViewPresenterProtocol

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var shadowView: UIView!
    
    
    // MARK: - Properties
    private var timer = Timer()
    private var counter: Int = 0
    // MARK: - Init
    init(presenter: DetailViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
}

//MARK: - Private extension
extension DetailViewController {
    
    @objc func changeImage() {
        if counter < presenter.model.screenshoot.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
        }
    }
    
    func setupUI() {
        title = presenter.model.nameOfProject
        shadowView.clipsToBounds = false
        shadowView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        shadowView.layer.shadowOpacity = 10
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowRadius = 10
        
        textArea.layer.cornerRadius = 15
        textArea.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        textArea.layer.borderWidth = 0.3
        
        let nibCell = UINib(nibName: "DetailCVCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "CellForScreen")
        collectionView.delegate = self
        collectionView.dataSource = self
        pageView.numberOfPages = presenter.model.screenshoot.count
        pageView.currentPage = 0
        textArea.text = presenter.model.description
    }
}

//MARK: - ColectionViewDataSource
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.model.screenshoot.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForScreen", for: indexPath) as! DetailCVCell
        cell.cellImage.image = UIImage(named: presenter.model.screenshoot[indexPath.row])

        return cell
    }
}

//MARK: - CollectionViewDelegateFlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
