//
//  RestaurantData.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/14.
//

import Foundation

struct RestaurantData: Decodable {
    let results: Shop
}
struct Shop: Decodable {
    let shop: [Restaurant]
}
struct Restaurant: Decodable {
    let name: String
    let logo_image: String
    let address: String
    let mobile_access: String
    let open: String
    let lat: Double
    let lng: Double
    let photo: Photo
}
struct Photo: Decodable {
    let mobile: Mobile
}
struct Mobile: Decodable {
    let l: String
}
