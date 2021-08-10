//
//  ProgressHUD.swift
//  AutoCheckTask
//
//  Created by Decagon on 09/08/2021.
//

import Foundation
import ProgressHUD

final class HUD {
    class func show(status: String?) {
        DispatchQueue.main.async {
            ProgressHUD.show(status)
//            ProgressHUD.animationType = .circleStrokeSpin
            ProgressHUD.colorBackground = .black
        }
    }
    
    class func hide() {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
        }
    }
}
