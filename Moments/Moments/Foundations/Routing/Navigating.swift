//
//  Navigating.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import UIKit

protocol Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType , parameters: [String: String])
}

extension Navigating {
    func navigate(to destinationViewController: UIViewController, from sourceViewController: UIViewController, using transitionType: TransitionType) {
        switch transitionType {
        case .present:
            sourceViewController.present(destinationViewController, animated: true)
        case .show:
            sourceViewController.show(destinationViewController, sender: nil)
        }
    }
}
