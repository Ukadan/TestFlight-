import Foundation
import UIKit

class SettingViewConroller: UIViewController {
    var coordinator: SettingFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    @objc func showDetailTapped(_ sender: UIButton) {
        coordinator?.coordinateToDetail()
    }
    
    let showDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(showDetailTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

extension SettingViewConroller {
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(showDetailButton)
        
        NSLayoutConstraint.activate([
            showDetailButton.widthAnchor
                .constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            showDetailButton.heightAnchor
                .constraint(equalToConstant: 50),
            showDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            showDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
