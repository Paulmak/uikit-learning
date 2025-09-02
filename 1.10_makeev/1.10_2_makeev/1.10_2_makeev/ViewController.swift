//
//  ViewController.swift
//  1.10_2_makeev
//
//  Created by Pavel on 01.09.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
}
