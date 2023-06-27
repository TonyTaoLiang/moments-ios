//
//  PersistentDataStoreType.swift
//  Moments
//
//  Created by chenying on 2023/6/26.
//

import Foundation
import RxSwift

protocol PersistentDataStoreType {
    var momentsDetails: ReplaySubject<Viewer> {get}
    func save(momentsDetails: Viewer)
}
