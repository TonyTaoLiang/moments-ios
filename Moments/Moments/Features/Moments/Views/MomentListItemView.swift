//
//  MomentListItemView.swift
//  Moments
//
//  Created by Tonytaoliang on 2023/7/15.
//

import Foundation
import UIKit
import DesignKit

final class MomentListItemView: BaseListItemView {

    private let nameLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.designKit.title3
        $0.textColor = .red
        $0.numberOfLines = 1
    }

    override init(frame: CGRect = .zero) {

        super.init(frame: frame)

        setupUI()
        setupConstraints()
    }

    // swiftlint:disable unavailable_function
    required init?(coder aDecoder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }
    // swiftlint:enable unavailable_function

    override func update(with viewModel: ListItemViewModel) {
        guard let viewModel = viewModel as? MomentListItemViewModel else {
            return
        }

        nameLabel.text = viewModel.nodes.first
    }

}

private extension MomentListItemView {
    func setupUI() {
        backgroundColor = UIColor.designKit.background

        addSubview(nameLabel)
    }

    func setupConstraints() {
//        backgroundImageView.snp.makeConstraints {
//            $0.top.leading.trailing.equalToSuperview()
//            $0.bottom.equalToSuperview().offset(-Spacing.medium)
//            $0.height.equalTo(backgroundImageView.snp.width).multipliedBy(0.8).priority(999)
//        }
//
//        avatarImageView.snp.makeConstraints {
//            $0.right.equalToSuperview().offset(-Spacing.medium)
//            $0.bottom.equalToSuperview()
//            $0.height.equalTo(80)
//            $0.width.equalTo(80)
//        }

        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-Spacing.medium)
        }
    }
}
