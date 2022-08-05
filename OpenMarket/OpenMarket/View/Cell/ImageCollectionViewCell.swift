//
//  ImageCollectionViewCell.swift
//  OpenMarket
//
//  Created by Kiwon Song on 2022/08/02.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    let productImage = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureCell() {
        productImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(productImage)
        
        NSLayoutConstraint.activate([
            productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            productImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            productImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        ])
    }
    
    private func configureContent() {
        productImage.backgroundColor = .systemGray5
    }
    
}
