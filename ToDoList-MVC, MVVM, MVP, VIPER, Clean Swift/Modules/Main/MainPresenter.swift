//
//  MainPresenter.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 24.03.2022.
//

// MARK: - MainPresenterProtocol
protocol MainPresenterProtocol: AnyObject {
    func loadData()
    func routToMvp()
}

// MARK: - MainPresenter
final class MainPresenter {
    weak var viewController: MainViewProtocol?
    private let networkService: NetworkableProtocol
    
    init(networkService: NetworkableProtocol) {
        self.networkService = networkService
    }
}

// MARK: - MainPresenterProtocol Impl
extension MainPresenter: MainPresenterProtocol {
    func loadData() {
        let data = networkService.requestData()
        viewController?.display(data)
    }
    
    func routToMvp() {
        
    }
}
