//
//  TogglesDataStoreType.swift
//  Moments
//
//  Created by Tonytaoliang on 2022/10/6.
//

import Foundation

protocol ToggleType {}

protocol TogglesDataStoreType {
    func isToggleOn(_ toggle: ToggleType) -> Bool
    func update(toggle: ToggleType, value: Bool)
}
