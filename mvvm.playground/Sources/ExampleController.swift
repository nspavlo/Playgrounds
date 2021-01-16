import Foundation

// MARK: Initialization

public final class ExampleController: ExampleViewModel {
    let client: RequestDispatcher
    let storage: Storage

    public weak var delegate: ExampleViewModelDelegate?

    init(client: RequestDispatcher, storage: Storage) {
        self.client = client
        self.storage = storage
    }
}

// MARK: Public Methods

public extension ExampleController {
    func fetchExample() {
        delegate?.viewModel(self, didChangeState: .loading)

        // Fetch data using abstract client
        // Persist data

        delegate?.viewModel(self, didChangeState: .updating)
    }
}
