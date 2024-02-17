//
//  ViewController.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/09.
//

import UIKit
import CoreLocation

class SearchViewController: UIViewController {
    var searchVCStackView = SearchVCStackView(frame: CGRect())
    var restaurants = [Restaurant]()
    let restaurantManager = RestaurantManager()
    var range = 3
    var lat = 0.0
    var lng = 0.0
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "検索"
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.searchVCStackView.distanceSC.addTarget(self, action: #selector(self.segmentChanged(_:)), for: .valueChanged)
        self.searchVCStackView.searchButton.addTarget(self, action: #selector(self.screenTransition(_:)), for: .touchUpInside)
        self.view.addSubview(self.searchVCStackView)
        self.searchVCStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.searchVCStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            self.searchVCStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        ])
    }
    override func viewWillAppear(_ animated: Bool) {
        self.view.isUserInteractionEnabled = true
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
        self.view.isUserInteractionEnabled = false
        self.restaurantManager.fetchLocation(lat: self.lat, lng: self.lng, range: self.range) { restaurants in
            DispatchQueue.main.async {
                self.restaurants = restaurants
                let resultVC = ResultViewController()
                resultVC.restaurants = self.restaurants
                self.navigationController?.pushViewController(resultVC, animated: true)
            }
        }
    }
}
extension SearchViewController: CLLocationManagerDelegate {
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
