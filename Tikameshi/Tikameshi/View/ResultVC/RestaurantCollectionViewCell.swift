//
//  RestaurantCollectionViewCell.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/17.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    private var cellImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        self.contentView.addSubview(cellImageView)
        self.cellImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.cellImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.0),
            self.cellImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 1.0),
            self.cellImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            self.cellImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
        ])
    }
    func setUpContents(imageURL: String) {
        let logoImageView = LogoImageView(logoImageURL: imageURL)
        logoImageView.loadImageFromURL(url: URL(string: imageURL)!) { image in
            DispatchQueue.main.async {
                self.cellImageView.image = image
            }
        }
    }
}
