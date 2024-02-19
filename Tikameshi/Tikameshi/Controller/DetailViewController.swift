//
//  DetailViewController.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/19.
//

import UIKit

class DetailViewController: UIViewController {
    var restaurant: Restaurant!
    var detailVCStackView = UIStackView()
    var mapAppButton = ScreenTransitionButton(text: "案内をスタートする")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "詳細"
        self.view.backgroundColor = .vcColor
        self.detailVCStackView = DetailVCView(name: restaurant.name, address: restaurant.address, open: restaurant.open, topImageView: URLImageView(logoImageURL: restaurant.photo.mobile.l))
        self.view.addSubview(self.detailVCStackView)
        self.detailVCStackView.translatesAutoresizingMaskIntoConstraints = false
        self.mapAppButton.addTarget(self, action: #selector(self.transitionApp(_:)), for: .touchUpInside)
        self.view.addSubview(self.mapAppButton)
        self.mapAppButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.detailVCStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.detailVCStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.detailVCStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.mapAppButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.mapAppButton.topAnchor.constraint(equalTo: self.detailVCStackView.bottomAnchor, constant: 20)
        ])
    }
    @objc func transitionApp(_ sender: UIButton) {
        let daddr = NSString(format: "%f,%f", self.restaurant.lat, self.restaurant.lng)
        let urlString = "http://maps.apple.com/?daddr=\(daddr)&dirflg=w"
        let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = NSURL(string: encodedUrl!)!
        UIApplication.shared.open(url as URL)
    }
}
