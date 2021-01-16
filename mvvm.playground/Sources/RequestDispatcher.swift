import Foundation

// MARK: Protocol

public protocol RequestDispatcher {}

// MARK: Mock

public struct MockRequestDispatcher: RequestDispatcher {
    public init() {}
}
