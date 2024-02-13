//
//  ViewController.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/09.
//

import UIKit

class SearchViewController: UIViewController {
    var searchVCStackView: SearchVCStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "検索"
        self.searchVCStackView = SearchVCStackView(frame: CGRect())
        self.view.addSubview(self.searchVCStackView)
        self.searchVCStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.searchVCStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            self.searchVCStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            self.searchVCStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0)
        ])
    }
}

