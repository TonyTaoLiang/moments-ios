//
//  ListItemView.swift
//  Moments
//
//  Created by Tonytaoliang on 2023/7/15.
//

import Foundation

protocol ListItemView: AnyObject {
    func update(with viewModel: ListItemViewModel)
}
