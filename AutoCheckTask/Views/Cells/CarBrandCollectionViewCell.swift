//
//  CarBrandCollectionViewCell.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import UIKit

class CarBrandCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CarBrandCollectionViewCell"
    
    let carImage: UIImageView = {
        let image = UIImageView()
        image.constrainWidth(constant: 80)
        image.constrainHeight(constant: 80)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemGray5
        image.layer.cornerRadius = 40
        return image
    }()
    
    let carName: UILabel = {
        let name = UILabel()
        name.text = "Benz"
        name.textColor = .label
        name.font = .systemFont(ofSize: 18, weight: .medium)
        name.textAlignment = .center
        name.adjustsFontSizeToFitWidth = true
        return name
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(carImage)
        addSubview(carName)
        setupSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubview() {
        carImage.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: carName.topAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        carName.anchor(top: carImage.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 5, right: 0))
    }
    
}
