//
//  ModuleBuilderManager.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 24.03.2022.
//

// MARK: - ModuleBuilderProtocol
protocol ModuleBuilderProtocol {
    func setupMainViewController() -> MainViewController
    func setupMVPViewController() -> MvpViewController
}

// MARK: - ModuleBuilderManager
final class ModuleBuilderManager {
    
    private let networkManager: NetworkableProtocol
    
    init() {
        networkManager = NetworkManager()
    }
}

// MARK: - ModuleBuilderProtocol Impl
extension ModuleBuilderManager: ModuleBuilderProtocol {
    
    func setupMainViewController() -> MainViewController {
        let mainViewController = MainViewController()
        let mainPresenter = MainPresenter(networkService: networkManager, moduleBuilder: self)
        mainViewController.presenter = mainPresenter
        mainPresenter.viewController = mainViewController
        
        return mainViewController
    }
    
    func setupMVPViewController() -> MvpViewController {
        let mvpViewController = MvpViewController()
        return mvpViewController
    }
    
}
