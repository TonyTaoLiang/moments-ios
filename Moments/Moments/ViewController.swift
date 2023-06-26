//
//  ViewController.swift
//  Moments
//
//  Created by Tonytaoliang on 2022/9/18.
//

import UIKit
import DesignKit
import RxSwift

class ViewController: BaseViewController {
    let posebag: DisposeBag = .init()
    lazy var myButton: UIButton = configure(UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))) {
        $0.setTitle("Push", for: .normal)
        $0.setTitleColor(UIColor.designKit.primary, for: .normal)
        $0.addTarget(self, action: #selector(push), for: .touchUpInside)
        $0.titleLabel?.font = UIFont.designKit.title1
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
//        GetMomentsByUserIDSession().getMoments(userID: 10).subscribe { event in
//            print(event)
//        } onError: { error in
//            print(error)
//        }.disposed(by: posebag )
        MomentsRepo.shared.getMoments(userID: 10).subscribe { ev in
            print(ev)
        }
        MomentsRepo.shared.momentsDetails.subscribe(onNext: {
            print($0)
        }).disposed(by: posebag)
        
        let router = AppRouter.shared
        router.route(to: URL(string: "\(UniversalLinks.baseURL)InternalMenu"), from: self, using: .show)
    }
}
