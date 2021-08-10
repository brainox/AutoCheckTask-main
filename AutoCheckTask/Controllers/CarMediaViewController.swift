//
//  MoreDetailsViewController.swift
//  AutoCheckTask
//
//  Created by Decagon on 10/08/2021.
//

import UIKit
import SDWebImage

class CarMediaViewController: UIViewController {
    
    @IBOutlet weak var carMediaCollectionView: UICollectionView!

    var id = ""
    var carTitle = ""
    
    var carMedia = [CarMediaList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = carTitle
        getCarMedia()
    }
    
    private func getCarMedia() {
        HUD.show(status: "Fetching All Images")
        NetworkService.shared.fetchCarMedia(id: id) { [weak self] details, error in
            guard error == nil else {
                return
            }
            self?.carMedia = details?.carMediaList ?? []
            
            DispatchQueue.main.async {
                self?.carMediaCollectionView.reloadData()
                HUD.hide()
            }
        }
    }
    
}

extension CarMediaViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carMedia.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarMediaCollectionViewCell.identifier, for: indexPath) as? CarMediaCollectionViewCell else {
            return UICollectionViewCell()
        }
        let path = carMedia[indexPath.row]
        cell.imageName.text = path.name
        cell.carImage.sd_setImage(with: URL(string: path.url))
        return cell
    }
    
}

extension CarMediaViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 260)
    }
    
    
}
