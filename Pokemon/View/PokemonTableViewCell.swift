//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by Maxim on 10.03.2023.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    var heroImage = UIImageView()
    var nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(heroImage)
        addSubview(nameLabel)
        configureImageView()
        configureNameLabel()
        setImageConstraints()
        setNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with pokemon: Pokemon) {
        
    }

    func configureImageView() {
        heroImage.contentMode = .scaleToFill
        heroImage.layer.cornerRadius = 10
        heroImage.clipsToBounds = true

    }

    func configureNameLabel(){
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true // уменьшит, если размер велик
    }

    func setImageConstraints() {
        heroImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heroImage.centerYAnchor.constraint(equalTo: centerYAnchor), // центрировать в ячейке по Y
            heroImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            heroImage.heightAnchor.constraint(equalToConstant: 80),
            heroImage.widthAnchor.constraint(equalTo: heroImage.heightAnchor, multiplier: 16/9) // скорее всего в видео жестко закодировано так, чтобы влезли картинки 16/9
        ])
    }

    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: heroImage.trailingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 80),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12) // отступ -12

        ])
    }
}
