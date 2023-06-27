//
//  MomentsRepo.swift
//  Moments
//
//  Created by chenying on 2023/6/26.
//

import Foundation
import RxSwift

protocol MomentsRepoType {
    var momentsDetails: ReplaySubject<Viewer> { get }
    func getMoments(userID: Int) -> Observable<Void>
}

struct MomentsRepo: MomentsRepoType {
    //private(set)申明的方式来限制外部对属性的修改.但在当前文件中依然可改
    private(set) var momentsDetails: ReplaySubject<Viewer> = ReplaySubject.create(bufferSize: 1)
    private let disposeBag: DisposeBag = .init()
    private let persistentDataStore: PersistentDataStoreType
    private let getMomentsByUserIDSession: GetMomentsByUserIDSessionType
    static let shared = {
        return MomentsRepo(persistentDataStore: UserDefaultsPersistentDataStore.shared, getMomentsByUserIDSession: GetMomentsByUserIDSession())
    }()
    
    private init(persistentDataStore: PersistentDataStoreType, getMomentsByUserIDSession: GetMomentsByUserIDSessionType) {
        self.getMomentsByUserIDSession = getMomentsByUserIDSession
        self.persistentDataStore = persistentDataStore
        setupBindings()
    }
    func getMoments(userID: Int) -> RxSwift.Observable<Void> {
        return getMomentsByUserIDSession
            .getMoments(userID: userID)
            .do(onNext: { persistentDataStore.save(momentsDetails: $0) })
            .map { _ in () }
            .catchErrorJustReturn(())
    }
}

extension MomentsRepo {
    func setupBindings() {
        //网络请求getMoments-》本地保存save 改变了-》订阅到自己的momentsDetails上
        persistentDataStore.momentsDetails
            .subscribe(momentsDetails)
            .disposed(by: disposeBag)
    }
}
