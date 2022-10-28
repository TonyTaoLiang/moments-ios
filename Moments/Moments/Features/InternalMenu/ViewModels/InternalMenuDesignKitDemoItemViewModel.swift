//
//  InternalMenuDesignKitDemoItemViewModel.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import UIKit

final class InternalMenuDesignKitDemoItemViewModel: InternalMenuActionTriggerItemViewModel {
    private let router: AppRouting
    private let routingSourceProvider: RoutingSourceProvider

    init(_ router: AppRouting, _ routingSourceProvider: @escaping RoutingSourceProvider){
        self.router = router
        self.routingSourceProvider = routingSourceProvider
    }
    override var title: String {"DesignKitDemo"}
    override func select() {
        router.route(to: URL(string: "\(UniversalLinks.baseURL)DesignKit?productName=DesignKit&version=1.0.1"), from: routingSourceProvider(), using: .show)
    }
}
