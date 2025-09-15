//
//  ScrollView.swift
//  1.15_makeev
//
//  Created by Pavel on 15.09.2025.
//

import UIKit

final class ScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
