//
//  ViewController.swift
//  AutoCheckTask
//
//  Created by Decagon on 08/08/2021.
//

import UIKit
import SDWebImage

class CarHomeViewController: UIViewController {
    
    @IBOutlet weak var carCollectionView: UICollectionView!
    
    private var allCars = [CarResults]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carCollectionView.register(UINib(nibName: "MotorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MotorsCollectionViewCell.identifier)
        carCollectionView.register(CarsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CarsHeader.identifier)
        carCollectionView.showsVerticalScrollIndicator = false
        setupSearchBar()
        fetchAllCars()
        setupNavigationItems()
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Explore"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2.fill"), style: .done, target: self, action: #selector(didTapExplore))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bag.badge.plus"), style: .done, target: self, action: #selector(didTapExplore))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.backButtonTitle = ""
    }
    
    @objc func didTapExplore() {
        
    }
    
    private func setupSearchBar() {
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func fetchAllCars() {
        NetworkService.shared.fetchAllCars {[weak self] allCars, error in
            guard error == nil else {
                return
            }
            self?.allCars = allCars?.result ?? []
            DispatchQueue.main.async {
                self?.carCollectionView.reloadData()
            }
        }
    }
    
}

extension CarHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CarsHeader.identifier, for: indexPath) as? CarsHeader else {
            return UICollectionReusableView()
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = carCollectionView.dequeueReusableCell(withReuseIdentifier: MotorsCollectionViewCell.identifier, for: indexPath) as? MotorsCollectionViewCell else {
            fatalError()
        }
        
        let path = allCars[indexPath.row]
        
        let bigNumber = Int(path.marketplacePrice)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: bigNumber))
        
        cell.carName.text = path.title
        cell.carLocation.text = "\(path.city) - \(path.state)"
        cell.carPrice.text = "₦\(formattedNumber ?? "")"
        cell.carImage.sd_setImage(with: URL(string: path.imageUrl))
        cell.carRating.text = String(format: "%.1f", path.gradeScore ?? 5.0)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 547)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
}

extension CarHomeViewController: UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "CarDetails", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CarDetails") as! CarDetailsViewController
        vc.id = allCars[indexPath.row].id
        vc.carTitle = allCars[indexPath.row].title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CarHomeViewController: UISearchBarDelegate {}
