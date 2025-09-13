//
//  ViewController.swift
//  1.13_makeev
//
//  Created by Pavel on 10.09.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
}
