//
//  UIApplicationExtensions.swift
//  Moments
//
//  Created by chenying on 2022/10/26.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        let keyWindow = connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows
                .first(where: { $0.isKeyWindow })
        return keyWindow?.rootViewController
    }

    static var appVersion: String {
        // swiftlint:disable no_hardcoded_strings
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
        // swiftlint:enable no_hardcoded_strings
    }

    var isRunningUnitTests: Bool {
        // swiftlint:disable no_hardcoded_strings
        return NSClassFromString("XCTestCase") != nil
        // swiftlint:enable no_hardcoded_strings
    }
}
