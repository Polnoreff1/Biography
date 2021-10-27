//
//  FlowViewController.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import UIKit

class FlowViewController: UIViewController {

    
    private var embedTabBarVc: UITabBarController = UITabBarController()
    
    
    private lazy var startViewController: UINavigationController = instantiateStartVC()
    private let navigator: Navigator
    
    init(navigator: Navigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //этот метод под вопросом
    func setSelectedIndex(index: Int) {
        embedTabBarVc.selectedIndex = index
    }
}




extension FlowViewController {
    
    private func initialSetup() {
        view.backgroundColor = .white
        embedTabBarVc.delegate = self
        embedTabBarVc.viewControllers = [startViewController]
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
    
    private func instantiateDetailVC() -> UINavigationController {
        let presenter = StartViewPresenter(navigator: navigator)
        let vc = StartViewController(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(title: "Мои проекты",
                                     image: UIImage(systemName: "person"),
                                     selectedImage: UIImage(systemName: "person.fill")
        )
        return navigationVC
    }
    
    
    
}

extension FlowViewController: UITabBarControllerDelegate {
    
}
