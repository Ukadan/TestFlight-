import UIKit

protocol SettingFlow: AnyObject {
    func coordinateToDetail()
}

class SettingsCoordinator: BaseCoordinator, SettingFlow {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let settingViewController = SettingViewConroller()
        settingViewController.coordinator = self
        navigationController.pushViewController(settingViewController, animated: true)
    }
    
    func coordinateToDetail() {
        let settingDetailCoordinator = SettingDetailtCoordinator(navigationController: navigationController)
        settingDetailCoordinator.start()
    }
}
