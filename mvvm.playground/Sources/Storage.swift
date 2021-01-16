import Foundation

// MARK: Protocol

public protocol Storage {}

// MARK: Mock

public struct MockStorage: Storage {
    public init() {}
}
