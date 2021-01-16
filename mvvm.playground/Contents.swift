import UIKit

let coordinator =
    ExampleCoordinator(
        router: UINavigationController(),
        factory: ExampleFlowFactory(
            client: MockRequestDispatcher(),
            storage: MockStorage()
        ))

coordinator.start()
