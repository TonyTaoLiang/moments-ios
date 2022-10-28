//
//  InternalMenuViewModel.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import RxSwift
import RxDataSources

protocol InternalMenuViewModelType {
    var title: String { get }
    var setions: Observable<[InternalMenuSection]> { get }
}

struct InternalMenuViewModel: InternalMenuViewModelType {
    let title = "隐藏窗口"
    var setions: Observable<[InternalMenuSection]>

    init(router: AppRouting, routingSourceProvider: @escaping RoutingSourceProvider) {
        let appVersion = "1.0.0.0"
        let infoSection = InternalMenuSection("General Info", [InternalMenuDescriptionItemViewModel(title: appVersion)])
        let featureTogglesSection = InternalMenuSection("Feature Toggles", [InternalMenuFeatureToggleItemViewModel("Like Button", InternalToggle.isLikeButtonForMomentEnabled, InternalTogglesDataStore.shared)])
        let toolsSection = InternalMenuSection(
            "Tools",
            [InternalMenuCrashAppItemViewModel()]
        )
        let designKit = InternalMenuSection("DesignKit", [InternalMenuDesignKitDemoItemViewModel(router, routingSourceProvider)])
        setions = .just([infoSection, featureTogglesSection, toolsSection, designKit])
    }
}
