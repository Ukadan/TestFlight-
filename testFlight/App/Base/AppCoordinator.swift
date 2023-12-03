import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    private var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        add(coordinator: tabBarCoordinator)
        tabBarCoordinator.start()
    }
}

