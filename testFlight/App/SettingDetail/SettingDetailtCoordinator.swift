import UIKit

protocol SettingDetailFlow {
    func dismissDetail()
}

class SettingDetailtCoordinator: BaseCoordinator, SettingDetailFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let settingDetailViewController = SettingDetailViewController()
        settingDetailViewController.coordinator = self
        settingDetailViewController.modalPresentationStyle = .overCurrentContext
        settingDetailViewController.modalTransitionStyle = .crossDissolve
        navigationController.pushViewController(settingDetailViewController, animated: true)
    }
    
    func dismissDetail() {
        navigationController.popViewController(animated: true)
    }
}
