//
//  RestaurantMnager.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/14.
//

import Foundation

class RestaurantManager {
    let restaurantURL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(ProcessInfo.processInfo.environment["API_KEY"] ?? "")&format=json"
    func fetchLocation(lat: Double, lng: Double, range: Int, completion: @escaping(([Restaurant]) -> Void)) {
        let urlString = "\(self.restaurantURL)&lat=\(lat)&lng=\(lng)&range=\(range)"
        self.performRequest(urlString: urlString, completion: completion)
    }
    func performRequest(urlString: String, completion: @escaping(([Restaurant]) -> Void)) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    completion([])
                    return
                }
                if let safeData = data {
                    let restaurants = self.parseJSON(restaurantData: safeData)
                    completion(restaurants)
                }
            }
            task.resume()
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
                restaurants.append(Restaurant(name: name, logo_image: logo_image, address: address, mobile_access: mobile_access, open: open))
            }
        } catch {
            print(error)
        }
        return restaurants
    }
}
