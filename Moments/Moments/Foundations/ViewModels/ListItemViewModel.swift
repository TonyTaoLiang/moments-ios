//
//  ListItemViewModel.swift
//  Moments
//
//  Created by chenying on 2023/7/14.
//

import Foundation

protocol ListItemViewModel {
    static var reuseIdentifier: String { get }
}

extension ListItemViewModel {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
