//
//  BuildTargetTogglesDataStore.swift
//  Moments
//
//  Created by Tonytaoliang on 2022/10/6.
//

import Foundation

enum BuildTargetToggle: ToggleType {
    case debug, `internal`, production
}

struct BuildTargetTogglesDataStore: TogglesDataStoreType {
    static let shared = BuildTargetTogglesDataStore()
    private let buildTarget: BuildTargetToggle

    init() {
        #if DEBUG
        buildTarget = .debug
        #endif
        #if INTERNAL
        buildTarget = .internal
        #endif
        #if PRODUCTION
        buildTarget = .production
        #endif
    }
    func isToggleOn(_ toggle: ToggleType) -> Bool {
        guard let result = toggle as? BuildTargetToggle else { return false }
        return buildTarget == result
    }
    func update(toggle: ToggleType, value: Bool) {}
}
