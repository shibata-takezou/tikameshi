//
//  LogoImageView.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/17.
//

import UIKit

class LogoImageView: UIImageView {
    init(logoImageURL: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        let imageURL = URL(string: logoImageURL)!
        loadImageFromURL(url: imageURL) { image in
            if let image = image {
                self.image = image
            } else {
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadImageFromURL(url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to load image from URL:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("Failed to convert data to image")
                    completion(nil)
                }
            }
        }.resume()
    }
}
