//
//  Functions.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import Foundation

func configure<T: AnyObject>(_ object: T, _ closure: (T) -> Void) -> T {
    closure(object)
    return object
}
