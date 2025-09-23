//
//  ViewController.swift
//  1.17_makeev
//
//  Created by Pavel on 21.09.2025.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "MainVC"
        navigationItem.rightBarButtonItem = .init(customView: mainView.actionButton)
        
        mainView.openDetailViewControllerAction = { [weak self] in
            let vc = DetailViewController(nibName: nil, bundle: nil)
            vc.delegate = self
            self?.navigationController?.pushViewController(vc, animated: true)
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
