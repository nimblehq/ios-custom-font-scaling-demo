import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let helloLabel = UILabel()
        helloLabel.font = UIFont.customFont(UIFont.ZenOldMincho.regular, forTextStyle: .body)
        helloLabel.text = R.string.localizable.homeLabelTitle()
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.adjustsFontForContentSizeCategory = true

        view.addSubview(helloLabel)

        NSLayoutConstraint.activate([
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        title = R.string.localizable.homeNavigationTitle()
    }
}
