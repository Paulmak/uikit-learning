//
//  ViewController.swift
//  1.5_makeev
//
//  Created by Pavel on 16.08.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
}
