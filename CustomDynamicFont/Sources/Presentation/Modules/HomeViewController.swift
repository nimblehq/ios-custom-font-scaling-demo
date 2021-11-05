import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let helloLabel = UILabel()
        helloLabel.font = UIFont.ZenOldMincho.regular.size(16.0)
        helloLabel.text = "Hello"
        helloLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(helloLabel)

        NSLayoutConstraint.activate([
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
