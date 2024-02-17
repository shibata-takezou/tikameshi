//
//  SearchVCStackView.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/13.
//

import UIKit
import CoreLocation

class SearchVCStackView: UIStackView {
    let labelText = "現在地から検索する距離を選択してください"
    let restaurantManager = RestaurantManager()
    var restaurants = [Restaurant]()
    var range = 3 //初期値1000m
    var lat = 0.0
    var lng = 0.0
    var label: UILabel {
        let label = UILabel()
        label.text = self.labelText
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }
    var distanceSC: DistanceSegmentedControl = {
        let distance = ["300m","500m","1000m","2000m","3000m"]
        let distanceSC = DistanceSegmentedControl(items: distance)
        distanceSC.translatesAutoresizingMaskIntoConstraints = false
        return distanceSC
    }()
    var searchButton = ScreenTransitionButton(text: "検索")
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addArrangedSubview(self.label)
        self.addArrangedSubview(self.distanceSC)
        self.addArrangedSubview(self.searchButton)
        self.axis = .vertical
        self.alignment = .center
        self.spacing = 42
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
