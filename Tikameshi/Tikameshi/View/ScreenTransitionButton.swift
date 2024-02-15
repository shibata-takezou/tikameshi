//
//  ScreenTransitionButton.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/12.
//

import UIKit

class ScreenTransitionButton: UIButton {
    init(text: String) {
        super.init(frame: CGRect())
        var config = ScreenTransitionButton.Configuration.filled()
        config.title = text
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40)
        self.configuration = config
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
