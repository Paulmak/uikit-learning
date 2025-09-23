//
//  MainView.swift
//  1.17_makeev
//
//  Created by Pavel on 22.09.2025.
//

import UIKit

final class MainView: UIView {
    
    lazy var actionButton: ActionButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Open details"
        
        let button = ActionButton(configuration: configuration)
        button.layer.borderColor = UIColor(.black).cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var openDetailViewControllerAction: (() -> Void)?
    
    @objc
    private func openDetailViewController() {
        openDetailViewControllerAction?()
    }
    
    private func setupTargets() {
        actionButton.addTarget(self, action: #selector(openDetailViewController), for: .touchUpInside)
    }
}
