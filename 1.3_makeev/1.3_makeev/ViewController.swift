//
//  ViewController.swift
//  1.3_makeev
//
//  Created by Pavel on 07.08.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView: MainView
    
    init(mainView: MainView = MainView()) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
    }
}
