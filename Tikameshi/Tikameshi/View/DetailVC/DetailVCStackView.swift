//
//  DetailVCView.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/19.
//

import UIKit

class DetailVCView: UIStackView {
    var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var address: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var open: UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var topImageView = UIImageView()
    init(name: String, address: String, open: String, topImageView: URLImageView) {
        super.init(frame: CGRect())
        self.name.text = name
        self.address.text = address
        self.labelLinesSetUP(word: open)
        self.topImageView = topImageView
        self.setUP()
    }
    private func labelLinesSetUP(word: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let openText = NSAttributedString(string: word, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        self.open.attributedText = openText
    }
    private func setUP() {
        self.axis = .vertical
        self.alignment = .leading
        self.spacing = 20
        self.addArrangedSubview(self.name)
        self.addArrangedSubview(self.topImageView)
        self.topImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(self.address)
        self.addArrangedSubview(self.open)
        NSLayoutConstraint.activate([
            self.topImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
            self.topImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
            self.open.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0)
        ])
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
