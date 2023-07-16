// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Development {
    /// init(coder:) has not been implemented
    internal static let fatalErrorInitCoderNotImplemented = L10n.tr("Localizable", "development.fatalErrorInitCoderNotImplemented")
    /// Subclass has to implement this function
    internal static let fatalErrorSubclassToImplement = L10n.tr("Localizable", "development.fatalErrorSubclassToImplement")
    /// /graphql
    internal static let graphqlPath = L10n.tr("Localizable", "development.graphqlPath")
    /// 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
    internal static let token = L10n.tr("Localizable", "development.token")
  }

  internal enum InternalMenu {
    /// DesignKit Demo
    internal static let designKitDemo = L10n.tr("Localizable", "internalMenu.designKitDemo")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
