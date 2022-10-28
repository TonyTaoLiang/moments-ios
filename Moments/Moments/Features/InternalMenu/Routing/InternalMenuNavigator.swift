//
//  InternalMenuNavigator.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import UIKit

struct InternalMenuNavigator: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        let togglesDataStore: TogglesDataStoreType = BuildTargetTogglesDataStore.shared
        guard togglesDataStore.isToggleOn(BuildTargetToggle.debug) || togglesDataStore.isToggleOn(BuildTargetToggle.internal) else {
            return
        }
        let controller = InternalMenuViewController()
        navigate(to: controller, from: viewController, using: transitionType)
    }
}
