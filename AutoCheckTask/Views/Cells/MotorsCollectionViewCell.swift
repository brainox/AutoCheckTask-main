//
//  MotorsCollectionViewCell.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import UIKit

class MotorsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MotorsCollectionViewCell"

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carLocation: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carRating: UILabel!
    

}
