//
//  ResultCard.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/17.
//

import UIKit

class ResultCard: UIView {
    var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var access: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var logoImageView = UIImageView()
    var labelVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    var cardHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    var arrowSymbol: UIImageView = {
        let image = UIImage(systemName: "greaterthan", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 17)))
        let imageView = UIImageView(image: image)
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    init(logoImageView: URLImageView, name: String, access: String) {
        super.init(frame: CGRect())
        self.backgroundColor = .white
        self.logoImageView = logoImageView
        self.logoImageView.layer.cornerRadius = 18
        self.logoImageView.layer.masksToBounds = true
        self.logoImageView.contentMode = .scaleToFill
        self.layer.cornerRadius = 18
        self.name.text = name
        self.access.text = access
        self.cardSetUP()
        self.addSubview(self.cardHStackView)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.logoImageView.widthAnchor.constraint(equalToConstant: 100),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 100),
            self.cardHStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.cardHStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.cardHStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.cardHStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            self.labelVStackView.leadingAnchor.constraint(equalTo: self.logoImageView.trailingAnchor, constant: 0)
        ])
    }
    func cardSetUP() {
        self.labelVStackView.addArrangedSubview(self.name)
        self.labelVStackView.addArrangedSubview(self.access)
        self.cardHStackView.addArrangedSubview(self.logoImageView)
        self.cardHStackView.addArrangedSubview(self.labelVStackView)
        self.cardHStackView.addArrangedSubview(self.arrowSymbol)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
