//
//  RoutingSource.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import Foundation
import UIKit

protocol RoutingSource {}
typealias RoutingSourceProvider = () -> RoutingSource?
//通过协议解耦UIViewController
extension UIViewController: RoutingSource{}
