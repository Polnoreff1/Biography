//
//  NewsViewController.swift
//  Biography
//
//  Created by Андрей  on 30.10.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Property
    private let presenter: NewsViewPresenterProtocol
    private var arrayNews: [Result] = []
    
    //MARK: - Init
    init(presenter: NewsViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getNews()
    }
}

//MARK: - Private extension
private extension NewsViewController {
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.nib, forCellReuseIdentifier: NewsTableViewCell.identifier)
    }
    
    func getNews() {
        presenter.getNews(period: 7) { model in
            guard let model = model else { return }
            print(model)
            self.arrayNews = model
            self.tableView.reloadData()
        }
    }
}

//MARK: - TableDataSource
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as! NewsTableViewCell
        return cell.configure(with: arrayNews[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = arrayNews[indexPath.row]
        presenter.pushToDetailVC(view: self, result: model)
    }
    
 
}
