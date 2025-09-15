//
//  ViewController.swift
//  1.15_makeev
//
//  Created by Pavel on 15.09.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
}
