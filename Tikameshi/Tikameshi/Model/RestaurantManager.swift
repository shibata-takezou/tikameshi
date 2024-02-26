//
//  RestaurantMnager.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/14.
//

import Foundation
import UIKit

class RestaurantManager {
    let restaurantURL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(ProcessInfo.processInfo.environment["API_KEY"] ?? "")&format=json&count=100"
    func fetchLocation(lat: Double, lng: Double, range: Int, completion: @escaping(([Restaurant]) -> Void)) {
        let urlString = "\(self.restaurantURL)&lat=\(lat)&lng=\(lng)&range=\(range)"
        self.performRequest(urlString: urlString, completion: completion)
    }
    func performRequest(urlString: String, completion: @escaping(([Restaurant]) -> Void)) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error fetching data: \(error)")
                    DispatchQueue.main.async {
                        self.searchError()
                    }
                    completion([])
                    return
                }
                if let data = data {
                    let restaurants = self.parseJSON(restaurantData: data)
                    completion(restaurants)
                }
            }
            task.resume()
        }
    }
    func searchError() {
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            let alert = UIAlertController(title: "エラー", message: "検索処理でエラーが発生しました。もう一度お試しください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                viewController.loadView()
                viewController.viewDidLoad()
            }))
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    func parseJSON(restaurantData: Data) -> [Restaurant] {
        var restaurants: [Restaurant] = []
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RestaurantData.self, from: restaurantData)
            for shop in decodedData.results.shop {
                let name = shop.name
                let logo_image = shop.logo_image
                let address = shop.address
                let mobile_access = shop.mobile_access
                let open = shop.open
                let lng = shop.lng
                let lat = shop.lat
                let photo = shop.photo
                restaurants.append(Restaurant(name: name, logo_image: logo_image, address: address, mobile_access: mobile_access, open: open, lat: lat, lng: lng, photo: photo))
            }
        } catch {
            print(error)
        }
        return restaurants
    }
}
