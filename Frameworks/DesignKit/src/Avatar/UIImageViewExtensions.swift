//
//  UIImageViewExtensions.swift
//  DesignKit
//
//  Created by Tonytaoliang on 2022/9/30.
//

import UIKit

public extension UIImageView {
    func asAvatar(cornerRadius: CGFloat = 4) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
}
