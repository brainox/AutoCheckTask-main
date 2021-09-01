//
//  CarsHeaderViewController.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import UIKit
import SDWebImage

class CarsHeaderViewController: UICollectionViewController {
    
    var carBrands = [MakeList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CarBrandCollectionViewCell.self, forCellWithReuseIdentifier: CarBrandCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemGray6
        collectionView.showsHorizontalScrollIndicator = false
        getCarBrands()
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.register(CarBrandCollectionViewCell.self, forCellWithReuseIdentifier: CarBrandCollectionViewCell.identifier)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getCarBrands() {
        HUD.show(status: "Fetching All Cars")
        NetworkService.shared.fetchAppsHeader { [weak self] cars, error in
            guard error == nil else { return }
            self?.carBrands = cars?.makeList ?? []
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                HUD.hide()
            }
        }
    }
    
}

// DataSource Section
extension CarsHeaderViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.carBrands.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarBrandCollectionViewCell.identifier, for: indexPath) as? CarBrandCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.carName.text = carBrands[indexPath.row].name
        let imageUrl = URL(string: carBrands[indexPath.row].imageUrl)
        cell.carImage.sd_setImage(with: imageUrl)
        return cell
    }
    
    
    
    
}

// Delegate
extension CarsHeaderViewController {
    
}

// Flow Layout
extension CarsHeaderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    

}
