//
//  StartViewController.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shadowView: UIView!
    
    // MARK: - Properties
    private let presenter: StartViewPresenterProtocol
    private var models = Model.getModel()
    
    // MARK: - Init
    init(presenter: StartViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }
}

    // MARK: - Private Extension
extension StartViewController {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyWorkTableViewCell.nib, forCellReuseIdentifier: MyWorkTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.layer.borderWidth = 0.5
        tableView.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tableView.layer.cornerRadius = 15
    }
    
    func setupUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.isTranslucent = true
        title = "Мои проекты"
        shadowView.clipsToBounds = false
        shadowView.layer.shadowColor = #colorLiteral(red: 0.9529411793, green: 0.8351009958, blue: 0.1757671637, alpha: 1)
        shadowView.layer.shadowOpacity = 2
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowRadius = 50
        shadowView.layer.cornerRadius = mainImageView.bounds.width / 2
        mainImageView.frame = shadowView.bounds
        mainImageView.image = UIImage(named: "ava")
        mainImageView.layer.cornerRadius = mainImageView.bounds.width / 2
        mainImageView.clipsToBounds = true
    }
}

//MARK: - TableViewDataSource
extension StartViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyWorkTableViewCell.identifier) as! MyWorkTableViewCell
        let model = models[indexPath.row]
        cell.imageView?.image = UIImage(named: model.preview)
        cell.textLabel?.text = model.nameOfProject
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.row]
        presenter.pushToDetailVC(view: self, result: model)
    }
}
