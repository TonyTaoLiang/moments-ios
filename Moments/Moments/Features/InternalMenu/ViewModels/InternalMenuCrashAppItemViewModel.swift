//
//  InternalMenuCrashAppItemViewModel.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import Foundation

final class InternalMenuCrashAppItemViewModel: InternalMenuActionTriggerItemViewModel {
    override var title: String { "CrashAPP" }

    override func select() {
        fatalError("CrashTest")
    }
}
