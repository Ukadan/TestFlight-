import UIKit

class HomeCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    private let viewModel = HomeViewModel()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let homeViewController = HomeViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
