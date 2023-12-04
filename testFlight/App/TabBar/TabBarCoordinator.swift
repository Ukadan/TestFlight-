import UIKit

final class TabBarCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        
        let settinghNavigationController = UINavigationController()
        settinghNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .contacts, tag: 1)
        let settingCoordinator = SettingsCoordinator(navigationController: settinghNavigationController)
        
       tabBarController.viewControllers = [homeNavigationController,
                                           settinghNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        homeCoordinator.start()
        settingCoordinator.start()
    }
}

