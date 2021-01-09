import UIKit
import System

// API Enhancements

// Closure Enhancements

class ClosureEnhancements {
    let view = UIView()

    func enhancement1() {
        UIView.animate(withDuration: 0.3) {

        } completion: { _ in

        }
    }

    func enhancement2() {
        UIView.animate(withDuration: 0.3) { [self] in
            _ = view
        } completion: { [self] _ in
            _ = view
        }
    }
}

// Multi-pattern catch clouses

do {
    let descriptor: FileDescriptor = try .open("", .init(rawValue: 99))
    try descriptor.close()
} catch Errno.notUsed {

} catch Errno.addressInUse {

} catch {

}

// Enum Enhancements

enum MessageStatus: Hashable, Comparable {
    case saved
    case sent
    case delivered
    case read

    var isDelivered: Bool {
        self >= .delivered
    }
}
