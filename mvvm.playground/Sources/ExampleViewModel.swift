import Foundation

// MARK: Delegate

public protocol ExampleViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: ExampleViewModel, didChangeState state: ExampleView.State)
}

// MARK: Protocol

public protocol ExampleViewModel: AnyObject {
    var delegate: ExampleViewModelDelegate? { get set }

    func fetchExample()
}
