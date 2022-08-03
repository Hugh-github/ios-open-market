//
//  AddProductView.swift
//  OpenMarket
//
//  Created by Kiwon Song on 2022/08/02.
//

import UIKit

class AddProductInfoCollectionViewCell: UICollectionViewCell {
    private let priceStackView = UIStackView()
    private let infoStackView = UIStackView()
    private let verticalStackView = UIStackView()
    
    private let productNameTextField = UITextField()
    private let productPriceTextField = UITextField()
    private let segmentedControl = UISegmentedControl(items: ["KRW", "USD"])
    private let productBargainPriceTextField = UITextField()
    private let stockTextField = UITextField()
    private let descriptionTextView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAttribute()
        configureCell()
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureAttribute() {
        let priceHuggingPriority = productPriceTextField.contentHuggingPriority(for: .horizontal) + 1
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillEqually
        infoStackView.spacing = 8
        
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.axis = .horizontal
        priceStackView.distribution = .fill
        priceStackView.spacing = 8
        
        productNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        productPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.setContentHuggingPriority(priceHuggingPriority, for: .horizontal)
        
        productBargainPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        
        stockTextField.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCell() {
        contentView.addSubview(verticalStackView)
        
        priceStackView.addArrangedSubview(productPriceTextField)
        priceStackView.addArrangedSubview(segmentedControl)
        
        infoStackView.addArrangedSubview(productNameTextField)
        infoStackView.addArrangedSubview(priceStackView)
        infoStackView.addArrangedSubview(productBargainPriceTextField)
        infoStackView.addArrangedSubview(stockTextField)
        
        verticalStackView.addArrangedSubview(infoStackView)
        verticalStackView.addArrangedSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func configureContent() {
        productNameTextField.borderStyle = .roundedRect
        productNameTextField.placeholder = "상품명"
        productNameTextField.keyboardType = .default
        
        productPriceTextField.borderStyle = .roundedRect
        productPriceTextField.placeholder = "상품가격"
        productPriceTextField.keyboardType = .numberPad
        
        segmentedControl.selectedSegmentIndex = 0
        
        productBargainPriceTextField.borderStyle = .roundedRect
        productBargainPriceTextField.placeholder = "할인금액"
        productBargainPriceTextField.keyboardType = .numberPad
        
        stockTextField.borderStyle = .roundedRect
        stockTextField.placeholder = "재고수량"
        stockTextField.keyboardType = .numberPad
        
        descriptionTextView.text = "힘들다 힘들어"
        descriptionTextView.font = UIFont.preferredFont(forTextStyle: .footnote)
        descriptionTextView.keyboardType = .default
    }
}
