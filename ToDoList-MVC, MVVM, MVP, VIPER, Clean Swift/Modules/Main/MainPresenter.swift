//
//  MainPresenter.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 24.03.2022.
//

// MARK: - MainPresenterProtocol
protocol MainPresenterProtocol: AnyObject {
    func fetchArchitectures()
    func fetchArchitecture(by index: Int)
}

// MARK: - MainPresenter
final class MainPresenter {
    weak var viewController: MainViewProtocol?
    
    private let networkService: NetworkableProtocol
    private let moduleBuilder: ModuleBuilderProtocol
    
    private var arhitectures: [ArhitectureModel] = []
    
    init(networkService: NetworkableProtocol, moduleBuilder: ModuleBuilderProtocol) {
        self.networkService = networkService
        self.moduleBuilder = moduleBuilder
    }
}

// MARK: - MainPresenterProtocol Impl
extension MainPresenter: MainPresenterProtocol {
    func fetchArchitectures() {
        networkService.request { [weak self] result in
            switch result {
            case .success(let response):
                self?.arhitectures = response
                self?.viewController?.display(response)
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchArchitecture(by index: Int) {
        let arhitecture = arhitectures[index]
        
        switch arhitecture.type {
        case .mvp:
            let mvpViewController = moduleBuilder.setupMVPViewController()
            viewController?.routeTo(mvpViewController)
        case .mvvm:
            break
        case .viper:
            break
        case .cleanSwift:
            break
    }
    
    }
}
