import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCoordinator() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(TabBarCoordinator.self, initializer: TabBarCoordinator.init)
        autoregister(SettingsCoordinator.self, initializer: SettingsCoordinator.init)
        autoregister(SettingDetailtCoordinator.self, initializer: SettingDetailtCoordinator.init)
        autoregister(HomeCoordinator.self, initializer: HomeCoordinator.init)
    }
}
