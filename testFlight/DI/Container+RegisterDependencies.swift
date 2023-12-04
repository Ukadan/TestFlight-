import Swinject

extension Container {
    func registerDependencies() {
        registerViewModels()
        registerCoordinator()
    }
}
