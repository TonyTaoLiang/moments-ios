//
//  AppRouting.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import Foundation

protocol AppRouting {
    func register(path: String, navigator: Navigating)
    func route(to url: URL?, from routingSource: RoutingSource?, using transitionType: TransitionType)
}
