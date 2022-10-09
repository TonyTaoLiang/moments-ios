//
//  InternalMenuActionTriggerCell.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import UIKit

class InternalMenuActionTriggerCell: UITableViewCell, InternalMenuCellType {
    func update(with item: InternalMenuItemViewModel) {
        guard let item = item as? InternalMenuActionTriggerItemViewModel else { return }
        textLabel?.text = item.title
        accessoryType = .disclosureIndicator
    }
}
