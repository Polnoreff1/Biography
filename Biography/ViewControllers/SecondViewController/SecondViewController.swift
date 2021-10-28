//
//  SecondViewController.swift
//  Biography
//
//  Created by Андрей  on 28.10.2021.
//

import UIKit
import NKButton

class SecondViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var halfTopView: UIView!
    @IBOutlet weak var subscribeButton: NKButton!
    
    //MARK: - Property
    private let presenter: SecondViewPresenterProtocol
    
    //MARK: - Init
    init(presenter: SecondViewPresenter) {
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
    }

    //MARK: - IBAction
    @IBAction func openInst(_ sender: Any) {
        
        let instagramHooks = "instagram://user?username=havieronil"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.openURL(instagramUrl! as URL)
        } else {
          //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.openURL(NSURL(string: "http://instagram.com/havieronil")! as URL)
        }
    
    }
    
}

//MARK: - Private extension
extension SecondViewController {
    func setupUI() {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: halfTopView.bounds.size.width / 2, y: 0), radius: halfTopView.bounds.size.height, startAngle: 0.0, endAngle: .pi, clockwise: true)
        let circleShape = CAShapeLayer()
        circleShape.path = circlePath.cgPath
        halfTopView.layer.mask = circleShape

        subscribeButton.title = "Подписаться"
        subscribeButton.setTitleColor(.white, for: .normal)
        subscribeButton.setTitleColor(.white, for: .highlighted)
        subscribeButton.setBackgroundColor(.red, for: .normal)
        subscribeButton.setBackgroundColor(.gray, for: .highlighted)
        subscribeButton.spacing = 10.0
        subscribeButton.imageAlignment = .top
        subscribeButton.underlineTitleDisabled = true
        subscribeButton.isRoundedButton = false
        subscribeButton.cornerRadius = 10.0
        subscribeButton.extendSize = CGSize(width: 50, height: 20)
        subscribeButton.setBorderColor(.black, for: .normal)
        subscribeButton.setBorderColor(.white, for: .highlighted)
        subscribeButton.borderSize = 0.5
        subscribeButton.setShadowColor(.red, for: .normal)
        subscribeButton.setShadowColor(.red, for: .highlighted)
        subscribeButton.shadowOffset = CGSize(width: 0, height: 5)
        subscribeButton.shadowOpacity = 0.6
        subscribeButton.shadowRadius = 10
    }
}
