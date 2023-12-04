import UIKit

class HomeCoordinator: BaseCoordinator {
    
    private let viewModel = HomeViewModel()
    private var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let homeViewController = HomeViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
