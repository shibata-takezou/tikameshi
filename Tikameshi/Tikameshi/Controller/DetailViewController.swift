//
//  DetailViewController.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/19.
//

import UIKit

class DetailViewController: UIViewController {
    var restaurant: Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "詳細"
        self.view.backgroundColor = .vcColor
        print("\(restaurant.name)")
        print("\(restaurant.open)")
        print("\(restaurant.address)")
    }
}
