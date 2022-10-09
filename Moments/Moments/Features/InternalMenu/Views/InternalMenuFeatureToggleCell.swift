//
//  InternalMenuFeatureToggleCell.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class InternalMenuFeatureToggleCell: UITableViewCell, InternalMenuCellType {
    private let switchControl: UISwitch = configure(UISwitch()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private var item: InternalMenuFeatureToggleItemViewModel?
    private lazy var disposeBag: DisposeBag = DisposeBag()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupBindings()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func update(with item: InternalMenuItemViewModel) {
        guard let item = item as? InternalMenuFeatureToggleItemViewModel else { return }
        self.item = item
        textLabel?.text = item.title
        switchControl.isOn = item.isOn
    }
}

extension InternalMenuFeatureToggleCell {
    func setupUI() {
        accessoryView = switchControl
        selectionStyle = .none
    }
    func setupBindings() {
        switchControl.rx.isOn.changed
            .distinctUntilChanged()
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.item?.toggle(isOn: $0)
            })
            .disposed(by: disposeBag)
    }
}
