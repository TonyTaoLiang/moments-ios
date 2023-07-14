//
//  ListItemCell.swift
//  Moments
//
//  Created by chenying on 2023/7/14.
//

import Foundation

protocol ListItemCell: AnyObject {
    func update(with viewModel: ListItemViewModel)
}
