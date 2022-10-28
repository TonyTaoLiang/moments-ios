//
//  DesignKitDemoNavigator.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import UIKit

struct DesignKitDemoNavigator: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        let togglesDataStore: TogglesDataStoreType = BuildTargetTogglesDataStore.shared
        guard togglesDataStore.isToggleOn(BuildTargetToggle.debug) || togglesDataStore.isToggleOn(BuildTargetToggle.internal) else {
            return
        }
        guard let productName = parameters["productname"], let versionNumber = parameters["version"] else {
            return
        }
        navigate(to: DesignKitDemoViewController(productName: productName, versionNumber: versionNumber), from: viewController, using: transitionType)
    }
}
