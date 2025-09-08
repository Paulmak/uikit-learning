//
//  ViewController.swift
//  1.12_makeev
//
//  Created by Pavel on 06.09.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
}
