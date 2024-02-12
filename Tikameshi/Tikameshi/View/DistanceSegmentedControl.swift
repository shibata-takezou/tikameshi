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
        self.addTarget(self, action: #selector(self.segmentChanged(_:)), for: .valueChanged)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func segmentChanged(_ segment:UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            print("300を選択した。")
        case 1:
            print("500を選択した。")
        case 2:
            print("1000を選択した。")
        case 3:
            print("2000を選択した。")
        case 4:
            print("3000を選択した。")
        default:
            break
        }
    }
}
