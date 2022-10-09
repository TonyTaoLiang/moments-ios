//
//  InternalMenuSection.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import RxDataSources

struct InternalMenuSection: SectionModelType{
    let title: String
    let items: [InternalMenuItemViewModel]
    let footer: String?

    init(_ title: String, _ items:[InternalMenuItemViewModel], _ footer: String? = nil) {
        self.title = title
        self.items = items
        self.footer = footer
    }
    
    init(original: InternalMenuSection, items: [InternalMenuItemViewModel]) {
        self.init(original.title, items, original.footer)
    }
}
