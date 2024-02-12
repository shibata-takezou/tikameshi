//
//  ViewController.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/09.
//

import UIKit

class SearchViewController: UIViewController {
    var distanceSC: DistanceSegmentedControl!
    let distance = ["300m","500m","1000m","2000m","3000m"]
    var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "検索"
        self.distanceSC = DistanceSegmentedControl(items: self.distance)
        self.view.addSubview(self.distanceSC)
        self.distanceSC.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.distanceSC.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            self.distanceSC.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            self.distanceSC.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
        ])
    }
}

