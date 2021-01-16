import Foundation

// MARK: Initialization

public struct ExampleFlowFactory {
    let client: RequestDispatcher
    let storage: Storage

    public init(client: RequestDispatcher, storage: Storage) {
        self.client = client
        self.storage = storage
    }
}

// MARK: Factory Methods

public extension ExampleFlowFactory {
    func createExampleViewModel() -> ExampleViewModel {
        ExampleController(client: client, storage: storage)
    }

    func createExampleViewController(with viewModel: ExampleViewModel) -> ExampleViewController {
        ExampleViewController(viewModel: viewModel)
    }
}
