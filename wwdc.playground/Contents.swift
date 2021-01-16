import UIKit
import System

// ------TEMPLATE------
// 􀊖 [WWDC - \(session)]
// --------------------

// 􀊖 [WWDC - State of the Union]

// M1, M1, M1
// iOS 14
// -- Widgets written in swift-ui
// -- App clips
// -- Privacy cards
// -- Document tabs in xcode
// -- Test application responsibility
// -- Test store-kit


// 􀊖 [WWDC - Visually Accessible]

// SF Symbols


// 􀊖 [WWDC - Meet widget-kit]

// Glanceable + relevant + personalized
// Not a mini applications

// --------------------

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

// Multi-pattern catch closures

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
