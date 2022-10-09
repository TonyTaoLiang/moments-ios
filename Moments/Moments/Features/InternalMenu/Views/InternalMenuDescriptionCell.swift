//
//  InternalMenuDescriptionCell.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import UIKit

class InternalMenuDescriptionCell: UITableViewCell, InternalMenuCellType {
    func update(with item: InternalMenuItemViewModel) {
        guard let item = item as? InternalMenuDescriptionItemViewModel else { return }
        textLabel?.text = item.title
        selectionStyle = .none
    }
}
