//
//  UserDataStore.swift
//  Moments
//
//  Created by Tonytaoliang on 2023/7/15.
//

import Foundation
protocol UserDataStoreType {
    var userID: Int { get }
}

struct UserDataStore: UserDataStoreType {
    // Hardcode the user id to 0
    var userID: Int {
        5
    }

    private init() { }

    static let current = UserDataStore()
}
