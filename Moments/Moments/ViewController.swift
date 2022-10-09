//
//  ViewController.swift
//  Moments
//
//  Created by Tonytaoliang on 2022/9/18.
//

import UIKit
import DesignKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let name: String = String("Rose")
        print(name)
        print(Spacing.twoExtraLarge)
        let ui = UIImageView()
        ui.asAvatar()
        let ada = UIImageView()
        ada.asAvatar()
        if BuildTargetTogglesDataStore.shared.isToggleOn(BuildTargetToggle.debug) {
            print("Debug")
        }
        if !InternalTogglesDataStore.shared.isToggleOn(InternalToggle.isLikeButtonForMomentEnabled) {
            print("isLikeButtonForMomentEnabled:false")
        }
    }
}
