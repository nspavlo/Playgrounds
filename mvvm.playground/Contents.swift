import UIKit

// MARK: ExampleView
// MARK: Initialization

final class ExampleView: UIView {
    enum State {
        case loading
        case updating
        case error(Error)
    }

    enum Actions {
        case dummyExample
    }

    private let indicatorView = UIActivityIndicatorView(style: .medium)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Methods

private extension ExampleView {
    func setup() {
        setupLoadingView()
        setupUpdatingView()
        setupErrorView()
    }

    func setupLoadingView() {
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.startAnimating()
        addSubview(indicatorView)
        setupLoadingViewConstraints()
    }

    func setupLoadingViewConstraints() {
        indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func setupUpdatingView() {}
    func setupErrorView() {}
}

// MARK: Rendering

extension ExampleView {
    func render(state: State) {
        switch state {
        case .loading:
            renderLoading()
        case .updating:
            renderUpdating()
        case .error(let error):
            renderError(error)
        }
    }

    private func renderLoading() {}
    private func renderUpdating() {}
    private func renderError(_ error: Error) {}
}

// MARK: ExampleViewModel
// MARK: Delegate

protocol ExampleViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: ExampleViewModel, didChangeState state: ExampleView.State)
}

// MARK: Protocol

protocol ExampleViewModel: AnyObject {
    var delegate: ExampleViewModelDelegate? { get set }

    func fetchExample()
}

// MARK: Dummy Types For `ExampleController`

final class RequestDispatcher {}
final class Storage {}

// MARK: Initialization

final class ExampleController: ExampleViewModel {
    let client: RequestDispatcher
    let storage: Storage

    weak var delegate: ExampleViewModelDelegate?

    init(client: RequestDispatcher, storage: Storage) {
        self.client = client
        self.storage = storage
    }
}

// MARK: Public Methods

extension ExampleController {
    func fetchExample() {
        delegate?.viewModel(self, didChangeState: .loading)

        // Fetch data using abstract client
        // Persist data

        delegate?.viewModel(self, didChangeState: .updating)
    }
}

// MARK: ExampleViewController
// MARK: Initialization

final class ExampleViewController: UIViewController {
    let viewModel: ExampleViewModel
    let exampleView = ExampleView()

    init(viewModel: ExampleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: Private Methods

private extension ExampleViewController {
    func setup() {
        setupViewModel()
        setupExampleView()
    }

    func setupViewModel() {
        viewModel.delegate = self
        viewModel.fetchExample()
    }

    func setupExampleView() {
        exampleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exampleView)
        setupExampleViewConstraints()
    }

    func setupExampleViewConstraints() {
        exampleView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        exampleView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        exampleView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        exampleView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}

// MARK: ExampleViewModelDelegate

extension ExampleViewController: ExampleViewModelDelegate {
    func viewModel(_ viewModel: ExampleViewModel, didChangeState state: ExampleView.State) {
        exampleView.render(state: state)
    }
}

// MARK: ExampleCoordinator
// MARK: Protocol

protocol Coordinator {
    func start()
}

// MARK: Initialization

final class ExampleCoordinator: Coordinator {
    let navigation = UINavigationController()

    func start() {
        showExample()
    }
}

// MARK: Private Methods

private extension ExampleCoordinator {
    func showExample() {
        let viewModel = ExampleController(client: RequestDispatcher(), storage: Storage())
        let viewController = ExampleViewController(viewModel: viewModel)
        navigation.pushViewController(viewController, animated: true)
    }
}
