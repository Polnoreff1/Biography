//
//  FlowViewController.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import UIKit

class FlowViewController: UIViewController {

    // MARK: - Properties
    private let navigator: Navigator
    private let networkService: NetworkService
    private var embedTabBarVc: UITabBarController = UITabBarController()
    private lazy var startViewController: UINavigationController = instantiateStartVC()
    private lazy var secondViewController: UIViewController = instantiateSecondVC()
    private lazy var newsViewController: UINavigationController = instantiateNewsVC()
    
    
    
    // MARK: - Init
    init(navigator: Navigator, networkService: NetworkService) {
        self.navigator = navigator
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //MARK: - Over Method
    //этот метод под вопросом
    func setSelectedIndex(index: Int) {
        embedTabBarVc.selectedIndex = index
    }
}

// MARK: - Private Extension
extension FlowViewController {
    
    private func initialSetup() {
        view.backgroundColor = .white
        embedTabBarVc.delegate = self
        embedTabBarVc.viewControllers = [startViewController, secondViewController, newsViewController]
        embedTabBarVc.tabBar.isTranslucent = false
        embedTabBarVc.tabBar.tintColor = .black
        embedTabBarVc.tabBar.unselectedItemTintColor = .black
        addChild(embedTabBarVc, toContainer: view)
    }
    
    private func instantiateStartVC() -> UINavigationController {
        let presenter = StartViewPresenter(navigator: navigator)
        let vc = StartViewController(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(title: "Мои проекты",
                                     image: UIImage(systemName: "person"),
                                     selectedImage: UIImage(systemName: "person.fill")
        )
        return navigationVC
    }
    
    private func instantiateSecondVC() -> UIViewController {
        let presenter = SecondViewPresenter()
        let vc = SecondViewController(presenter: presenter)
        vc.tabBarItem = UITabBarItem(title: "Обо мне",
                                     image: UIImage(systemName: "aqi.low"),
                                     selectedImage: UIImage(systemName: "aqi.medium")
        )
        return vc
    }
    
    private func instantiateNewsVC() -> UINavigationController {
        let presenter = NewsViewPresenter(navigator: navigator, networkService: networkService)
        let vc = Biography.NewsViewController(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(title: "Новости",
                                     image: UIImage(systemName: "magnifyingglass.circle"),
                                     selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")
        )
        return navigationVC
    }
    
    
}

extension FlowViewController: UITabBarControllerDelegate {
    
}
