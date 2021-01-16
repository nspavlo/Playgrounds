import UIKit

// MARK: Initialization

public final class ExampleView: UIView {
    let indicatorView = UIActivityIndicatorView(style: .medium)

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
    public enum State {
        case loading
        case updating
        case error(Error)
    }

    public func render(state: State) {
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
