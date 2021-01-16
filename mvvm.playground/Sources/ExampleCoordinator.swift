import UIKit

// MARK: Initialization

public final class ExampleCoordinator {
    let router: UINavigationController
    let factory: ExampleFlowFactory

    public init(router: UINavigationController, factory: ExampleFlowFactory) {
        self.router = router
        self.factory = factory
    }
}

// MARK: Coordinator

extension ExampleCoordinator: Coordinator {
    public func start() {
        showExample()
    }
}

// MARK: Private Methods

private extension ExampleCoordinator {
    func showExample() {
        let viewModel = factory.createExampleViewModel()
        let viewController = factory.createExampleViewController(with: viewModel)
        router.pushViewController(viewController, animated: true)
    }
}
