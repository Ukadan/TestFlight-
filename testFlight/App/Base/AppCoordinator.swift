import Foundation
import UIKit
import Swinject

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    private var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    static let container = Container()
    
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

