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
    
    init() {
        
        let appVersion = "1.0.0.0"
        
        let infoSection = InternalMenuSection("General Info", [InternalMenuDescriptionItemViewModel(title: appVersion)])
        
        let featureTogglesSection = InternalMenuSection("FeatureToggles", [InternalMenuFeatureToggleItemViewModel("Like Button", InternalToggle.isLikeButtonForMomentEnabled, InternalTogglesDataStore.shared)])
        
        let toolsSection = InternalMenuSection(
            "Tools",
            [InternalMenuCrashAppItemViewModel()]
        )
        
        setions = .just([infoSection,featureTogglesSection,toolsSection])
    }
    
}
