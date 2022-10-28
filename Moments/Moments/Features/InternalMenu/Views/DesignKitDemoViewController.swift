//
//  DesignKitDemoViewController.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import UIKit

final class DesignKitDemoViewController: BaseViewController {
    private let productName: String
    private let versionNumber: String

    init(productName: String, versionNumber: String) {
        self.productName = productName
        self.versionNumber = versionNumber
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        print("productName:\(productName)  versionNumber:\(versionNumber)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
