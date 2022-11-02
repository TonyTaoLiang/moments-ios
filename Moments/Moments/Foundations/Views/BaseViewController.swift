//
//  BaseViewController.swift
//  Moments
//
//  Created by chenying on 2022/10/28.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    lazy var disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    @available(*,unavailable,message: "We don't support init view controller from a nib.")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.designKit.background
    }
}
