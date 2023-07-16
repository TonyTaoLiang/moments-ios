//
//  MomentListItemViewModel.swift
//  Moments
//
//  Created by Tonytaoliang on 2023/7/15.
//

import Foundation
import RxSwift

struct MomentListItemViewModel: ListItemViewModel {

    let nodes: [String]
    private let momentsRepo: MomentsRepoType

    init(moment: Viewer.Repositories, momentsRepo: MomentsRepoType = MomentsRepo.shared) {
        self.momentsRepo = momentsRepo
        nodes = moment.nodes.compactMap { $0.name }
    }
}
