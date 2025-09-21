//
//  DetailViewController.swift
//  1.16_makeev
//
//  Created by Pavel on 16.09.2025.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func changeBackgroundColorForMainView()
}

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.closeDetailViewAction = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        detailView.changeColorForMainViewAction = { [weak self] in
            self?.delegate?.changeBackgroundColorForMainView()
        }
    }
    
    override func loadView() {
        view = detailView
    }
}
