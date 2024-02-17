//
//  DistanceSegmentedControl.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/11.
//

import UIKit

class DistanceSegmentedControl: UISegmentedControl {
    override init(items: [Any]?) {
        super.init(items: items)
        self.selectedSegmentTintColor = .navbarSCColor
        self.selectedSegmentIndex = 2
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
