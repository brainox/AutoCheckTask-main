//
//  CarsHeader.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import UIKit

class CarsHeader: UICollectionReusableView {
    
    static let identifier = "CarsHeader"
    
    private let carsHeader = CarsHeaderViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(carsHeader.view)
        carsHeader.view.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
