//
//  AppRouter.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import UIKit

final class AppRouter: AppRouting {
    static let shared = AppRouter()
    var navigators: [String: Navigating] = [:]
    
    func register(path: String, navigator: Navigating) {
        navigators[path.lowercased()] = navigator
    }
    func route(to url: URL?, from routingSource: RoutingSource?, using transitionType: TransitionType) {
        guard let url = url, let sourceViewController = routingSource as? UIViewController ??  UIApplication.shared.rootViewController else { return }
        let path = url.lastPathComponent.lowercased()
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        let parameters: [String: String] = (urlComponents.queryItems ?? []).reduce(into: [:]) { params, queryItem in
            params[queryItem.name.lowercased()] = queryItem.value
        }
        navigators[path]?.navigate(from: sourceViewController, using: transitionType, parameters: parameters)
    }
}
