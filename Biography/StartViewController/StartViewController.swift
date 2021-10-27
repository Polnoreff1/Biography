//
//  StartViewController.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import UIKit

class StartViewController: UIViewController {


    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shadowView: UIView!
    
    private let presenter: StartViewPresenterProtocol
    
    var models = Model.getModel()
    
    init(presenter: StartViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension StartViewController {
    func setupUI() {
        title = "Мои проекты"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyWorkTableViewCell", bundle: nil), forCellReuseIdentifier: "workCell")
        
        tableView.separatorStyle = .none
        
        shadowView.clipsToBounds = false
        shadowView.layer.shadowColor = #colorLiteral(red: 0.2458430589, green: 0.7866883151, blue: 1, alpha: 1)
        shadowView.layer.shadowOpacity = 10
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowRadius = 20
        shadowView.layer.cornerRadius = mainImageView.bounds.width / 2
        
        mainImageView.frame = shadowView.bounds
        mainImageView.image = UIImage(named: "ava")
        mainImageView.layer.cornerRadius = mainImageView.bounds.width / 2
        mainImageView.clipsToBounds = true
        
    }
}


extension StartViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "workCell") as! MyWorkTableViewCell
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


