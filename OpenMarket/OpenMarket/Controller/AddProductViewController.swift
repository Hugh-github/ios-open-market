//
//  AddProductViewController.swift
//  OpenMarket
//
//  Created by Kiwon Song on 2022/08/01.
//

import UIKit

class AddProductViewController: UIViewController, UICollectionViewDelegate {
    private var collectionView: UICollectionView! = nil
    private var layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureCollectionView()
        configureNavigationBar()
        notificationCenter()
    }
    
    private func configureNavigationBar() {
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didCancelButtonTapped))
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didUpdateButtonTapped))
        navigationItem.title = "상품등록"
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @objc func didCancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didUpdateButtonTapped() {
        
    }
    
    func notificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let contentInset = UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: keyboardFrame.size.height,
            right: 0.0)
        collectionView.contentInset = contentInset
        collectionView.scrollIndicatorInsets = contentInset
    }
    
    @objc private func keyboardWillHide() {
        let contentInset = UIEdgeInsets.zero
        collectionView.contentInset = contentInset
        collectionView.scrollIndicatorInsets = contentInset
    }
    
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AddProductInfoCollectionViewCell.self, forCellWithReuseIdentifier: "ProductInfoCell")
        collectionView.register(AddProductImageCollectionViewCell.self, forCellWithReuseIdentifier: "ProductImageCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension AddProductViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageCell", for: indexPath)
                    as? AddProductImageCollectionViewCell else { return AddProductImageCollectionViewCell() }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductInfoCell", for: indexPath)
                    as? AddProductInfoCollectionViewCell else { return AddProductInfoCollectionViewCell() }
            
            return cell
        }
    }
}

extension AddProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            let width = collectionView.frame.width
            let size = CGSize(width: width, height: collectionView.frame.height * 0.21)
            
            return size
        } else {
            let width = collectionView.frame.width
            let size = CGSize(width: width, height: collectionView.frame.height * 0.79)
            
            return size
        }
    }
}
