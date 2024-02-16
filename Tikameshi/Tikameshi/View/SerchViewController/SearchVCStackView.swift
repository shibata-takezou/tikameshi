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
        distanceSC.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        distanceSC.translatesAutoresizingMaskIntoConstraints = false
        return distanceSC
    }()
    var searchButton: ScreenTransitionButton {
        let button = ScreenTransitionButton(text: "検索")
        button.addTarget(self, action: #selector(screenTransition(_:)), for: .touchUpInside)
        return button
    }
    let locationManager = CLLocationManager()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
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
    @objc func segmentChanged(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            self.range = 1
        case 1:
            self.range = 2
        case 2:
            self.range = 3
        case 3:
            self.range = 4
        case 4:
            self.range = 5
        default:
            break
        }
    }
    @objc func screenTransition(_ sender: UIButton) {
        self.restaurantManager.fetchLocation(lat: self.lat, lng: self.lng, range: self.range) { restaurants in
            DispatchQueue.main.async {
                self.restaurants = restaurants
                print(self.restaurants[0].name)
            }
        }
    }
}
extension SearchVCStackView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.lat = location.coordinate.latitude
            self.lng = location.coordinate.longitude
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error)")
    }
}
