//
//  API.swift
//  Moments
//
//  Created by chenying on 2022/12/14.
//

import Foundation

enum API {
    static let baseURL = try? URL(string: "https://" + Configuration.value(for: "API_BASE_URL"))!
}
