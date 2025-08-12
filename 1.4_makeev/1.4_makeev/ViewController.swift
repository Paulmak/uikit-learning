//
//  ViewController.swift
//  1.4_makeev
//
//  Created by Pavel on 11.08.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
}
