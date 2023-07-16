//
//  MomentsTimelineViewController.swift
//  Moments
//
//  Created by Tonytaoliang on 2023/7/15.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import DesignKit

final class MomentsTimelineViewController: BaseTableViewController {
    override init() {
        super.init()
        viewModel = MomentsTimelineViewModel(userID: UserDataStore.current.userID)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.trackScreenviews()
    }
    override var tableViewCellsToRegister: [String : UITableViewCell.Type] {
        return [
            MomentListItemViewModel.reuseIdentifier: BaseTableViewCell<MomentListItemView>.self
        ]
    }
}
