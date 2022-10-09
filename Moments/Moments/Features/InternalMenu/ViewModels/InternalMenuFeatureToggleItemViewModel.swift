//
//  InternalMenuFeatureToggleItemViewModel.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import Foundation

struct InternalMenuFeatureToggleItemViewModel: InternalMenuItemViewModel {
    var type: InternalMenuItemType = .featureToggle
    var title: String
    var toggle: ToggleType
    var toggleDataStore: TogglesDataStoreType
    
    init(_ title: String, _ toggle: ToggleType, _ toggleDataStore: TogglesDataStoreType) {
        self.title = title
        self.toggle = toggle
        self.toggleDataStore = toggleDataStore
    }
    
    var isOn: Bool {
        return toggleDataStore.isToggleOn(toggle)
    }
    
    func toggle(isOn: Bool) {
        toggleDataStore.update(toggle: toggle, value: isOn)
    }
    
}
