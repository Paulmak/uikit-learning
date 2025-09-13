//
//  ViewController.swift
//  1.14_makeev
//
//  Created by Pavel on 13.09.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
}
