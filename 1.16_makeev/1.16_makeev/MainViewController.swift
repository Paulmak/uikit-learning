//
//  ViewController.swift
//  1.16_makeev
//
//  Created by Pavel on 16.09.2025.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.openDetailViewAction = { [weak self] in
            let viewController = DetailViewController(nibName: nil, bundle: nil)
            viewController.delegate = self
            self?.present(viewController, animated: true)
        }
    }
    
    override func loadView() {
        view = mainView
    }
}

extension MainViewController: DetailViewControllerDelegate {
    
    func changeBackgroundColorForMainView() {
        let maxValue: CGFloat = 999.0
        
        mainView.backgroundColor = UIColor(
            red: CGFloat.random(in: 0...999) / maxValue,
            green: CGFloat.random(in: 0...999) / maxValue,
            blue: CGFloat.random(in: 0...999) / maxValue,
            alpha: 0.5
        )
    }
}
