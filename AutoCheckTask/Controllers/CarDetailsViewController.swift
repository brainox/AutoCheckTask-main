//
//  CarDetailsViewController.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import UIKit
import SDWebImage

class CarDetailsViewController: UIViewController {

    var id = ""
    var carTitle = ""
    
    @IBOutlet weak var carNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var mileageLbl: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var engineType: UILabel!
    @IBOutlet weak var vinLbl: UILabel!
    @IBOutlet weak var transmission: UILabel!
    @IBOutlet weak var fuelType: UILabel!
    
    var carDetails: CarDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        fetchCarDetails()
    }
    
    fileprivate func setupNavigationItems() {
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func fetchCarDetails() {
        NetworkService.shared.fetchCarDetails(id: id) {[weak self] details, error in
            guard error == nil else {
                return
            }
            self?.carDetails = details
            DispatchQueue.main.async { [weak self] in
                if let details = details {
                    
                    let bigNumber = Int(details.marketplacePrice)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    let formattedNumber = numberFormatter.string(from: NSNumber(value: bigNumber))
                    
                    self?.carNameLbl.text = details.model.name
                    self?.priceLbl.text = "₦\(formattedNumber ?? "")"
                    self?.mileageLbl.text = "\(details.mileage) \(details.mileageUnit)"
                    self?.locationLbl.text = "\(details.city), \(details.state)"
                    self?.carImage.sd_setImage(with: URL(string: details.imageUrl ))
                    self?.engineType.text = details.engineType
                    self?.vinLbl.text = details.vin
                    self?.transmission.text = details.transmission
                    self?.fuelType.text = details.fuelType
                }
            }
        }
    }
    
    
    @IBAction func didTapMoreDetails(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "CarMedia", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CarMedia") as! CarMediaViewController
        vc.id = id
        vc.carTitle = carTitle
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


