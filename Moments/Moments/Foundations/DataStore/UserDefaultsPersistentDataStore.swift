//
//  UserDefaultsPersistentDataStore.swift
//  Moments
//
//  Created by chenying on 2023/6/26.
//

import Foundation
import RxSwift

struct UserDefaultsPersistentDataStore: PersistentDataStoreType {
    
    static let shared: UserDefaultsPersistentDataStore = .init()
    private(set) var momentsDetails: ReplaySubject<Viewer> = ReplaySubject.create(bufferSize: 1)
    private let disposeBage: DisposeBag = .init()
    private let defaults = UserDefaults.standard
    private let momentsDetailsKey = String(describing: Viewer.self)
    
    private init() {
        setupBindings()
    }
    func save(momentsDetails: Viewer) {
        if let encodedData = try? JSONEncoder().encode(momentsDetails) {
            defaults.set(encodedData, forKey: momentsDetailsKey)
        }
    }
}

extension UserDefaultsPersistentDataStore {
    
    func setupBindings() {
        defaults.rx.observe(Data.self, momentsDetailsKey)
            .compactMap { $0 }
            .compactMap { try? JSONDecoder().decode(Viewer.self, from: $0) }
            .subscribe(momentsDetails)
            .disposed(by: disposeBage)
    }
}
