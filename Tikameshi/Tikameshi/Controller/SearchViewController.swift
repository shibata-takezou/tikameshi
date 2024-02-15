//
//  ViewController.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/09.
//

import UIKit

class SearchViewController: UIViewController {
    var searchVCStackView = SearchVCStackView(frame: CGRect())
    var restaurants = [Restaurant]()
    var restaurantManager = RestaurantManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "検索"
        self.restaurantManager.fetchLocation(lat: 35.09241565345719, lng: 136.92578109761166) { restaurants in
            DispatchQueue.main.async {
                self.restaurants = restaurants
            }
        }
        self.view.addSubview(self.searchVCStackView)
        self.searchVCStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.searchVCStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            self.searchVCStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        ])
    }
}

