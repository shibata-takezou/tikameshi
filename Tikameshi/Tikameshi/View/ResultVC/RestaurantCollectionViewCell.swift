//
//  RestaurantCollectionViewCell.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/17.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    private var resultCard: ResultCard?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpContents(imageURL: String, name: String, access: String) {
        let logoImageView = URLImageView(logoImageURL: imageURL)
        logoImageView.loadImageFromURL(url: URL(string: imageURL)!) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.resultCard?.removeFromSuperview()
                let newResultCard = ResultCard(logoImageView: logoImageView, name: name, access: access)
                self.contentView.addSubview(newResultCard)
                newResultCard.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    newResultCard.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                    newResultCard.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                    newResultCard.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                    newResultCard.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
                ])
                self.resultCard = newResultCard
            }
        }
        
    }
}
