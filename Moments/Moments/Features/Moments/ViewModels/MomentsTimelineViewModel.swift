//
//  MomentsTimelineViewModel.swift
//  Moments
//
//  Created by Tonytaoliang on 2023/7/15.
//

import Foundation
import RxSwift
import RxDataSources

struct MomentsTimelineViewModel: ListViewModel {
    private(set) var listItems: BehaviorSubject<[SectionModel<String, ListItemViewModel>]> = .init(value: [])
    private(set) var hasError: BehaviorSubject<Bool> = .init(value: false)

    private let disposeBag: DisposeBag = .init()
    private let userID: Int
    private let momentsRepo: MomentsRepoType

    init(userID: Int,
         momentsRepo: MomentsRepoType = MomentsRepo.shared) {
        self.userID = userID
        self.momentsRepo = momentsRepo

        setupBindings()
    }

    func loadItems() -> Observable<Void> {
        return momentsRepo.getMoments(userID: userID)
    }

    func trackScreenviews() {
        // The screen name should match the same screen on Android
//        trackingRepo.trackScreenviews(ScreenviewsTrackingEvent(screenName: L10n.Tracking.momentsScreen, screenClass: String(describing: self)))
    }
}

private extension MomentsTimelineViewModel {
    func setupBindings() {
        momentsRepo.momentsDetails
            .map {
                [MomentListItemViewModel(moment: $0.repositories)]
            }
            .subscribe(onNext: {
                listItems.onNext([SectionModel(model: "", items: $0)])
            }, onError: { _ in
                hasError.onNext(true)
            })
            .disposed(by: disposeBag)
    }
}

