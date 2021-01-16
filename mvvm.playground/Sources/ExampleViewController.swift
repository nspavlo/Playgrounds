import UIKit

// MARK: Initialization

public final class ExampleViewController: UIViewController {
    let viewModel: ExampleViewModel
    let exampleView = ExampleView()

    public init(viewModel: ExampleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
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
    public func viewModel(_ viewModel: ExampleViewModel, didChangeState state: ExampleView.State) {
        exampleView.render(state: state)
    }
}
