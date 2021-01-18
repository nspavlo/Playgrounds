import UIKit

// MARK: Decorators

protocol ViewDecorator {
    associatedtype View: UIView

    func decorate(view: View)
}

struct RoundViewDecorator: ViewDecorator {
    typealias View = UIView

    func decorate(view: UIView) {
        view.layer.cornerRadius = 12
        view.layer.backgroundColor = .init(gray: 1, alpha: 1)
    }
}

struct TextFieldViewDecorator: ViewDecorator {
    typealias View = UITextField

    func decorate(view: UITextField) {
        let decorator = RoundViewDecorator()
        decorator.decorate(view: view)

        view.textColor = .white
        view.font = .systemFont(ofSize: 20)
        view.tintColor = .white

        setupAttributedPlaceholder(for: view)
    }

    private func setupAttributedPlaceholder(for view: UITextField) {
        if let placeholder = view.placeholder {
            let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            view.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }
}

struct CredentialTextFieldViewDecorator: ViewDecorator {
    typealias View = UITextField

    func decorate(view: UITextField) {
        let decorator = TextFieldViewDecorator()
        decorator.decorate(view: view)

        view.autocapitalizationType = .none
        view.autocorrectionType = .no
    }
}

struct SecureTextFieldViewDecorator: ViewDecorator {
    typealias View = UITextField

    func decorate(view: UITextField) {
        let decorator = CredentialTextFieldViewDecorator()
        decorator.decorate(view: view)

        view.isSecureTextEntry = true
    }
}

struct ButtonViewDecorator: ViewDecorator {
    typealias View = UIButton

    func decorate(view: UIButton) {
        view.titleLabel?.font = .boldSystemFont(ofSize: 14)
        view.layer.cornerRadius = 26
        view.clipsToBounds = true
        view.setTitleColor(.purple, for: .normal)
    }
}

// MARK: Example

let button = UIButton()
let decorator = ButtonViewDecorator()
decorator.decorate(view: button)
