//
//  ResultViewController.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/17.
//

import UIKit

class ResultViewController: UIViewController {
    var restaurants = [Restaurant]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "結果"
        self.view.backgroundColor = .vcColor
        var logoImageView = LogoImageView(logoImageURL: restaurants[1].logo_image)
        self.view.addSubview(logoImageView)
        
    }
}
