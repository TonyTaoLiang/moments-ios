//
//  ViewController.swift
//  Moments
//
//  Created by Tonytaoliang on 2022/9/18.
//

import UIKit
import DesignKit

class ViewController: BaseViewController {
    lazy var myButton: UIButton = configure(UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))) {
        $0.setTitle("Push", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.addTarget(self, action: #selector(push), for: .touchUpInside)
        $0.titleLabel?.font = UIFont.designKit.body
        $0.titleLabel?.adjustsFontForContentSizeCategory = true
    }

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
        view.addSubview(self.myButton)
    }

    @objc func push() {
//        self.navigationController?.pushViewController(InternalMenuViewController(), animated: true)
//        self.present(InternalMenuViewController(), animated: true, completion: nil)
        let router = AppRouter.shared
        router.route(to: URL(string: "\(UniversalLinks.baseURL)InternalMenu"), from: self, using: .show)
    }
}
