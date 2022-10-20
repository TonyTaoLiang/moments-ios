//
//  InternalMenuActionTriggerItemViewModel.swift
//  Moments
//
//  Created by chenying on 2022/10/9.
//

import Foundation
//模拟抽象类：需要点击的cell都必须自己实现点击方法
//fatalError 第一是能防止调用者直接构造出InternalMenuActionTriggerItemViewModel的实例。第二是强迫其子类重写
class InternalMenuActionTriggerItemViewModel: InternalMenuItemViewModel {
    var type: InternalMenuItemType = .actionTrigger
    var title: String { fatalError("fatalErrorSubclassToImplement") }

    func select() { fatalError("fatalErrorSubclassToImplement") }
}
