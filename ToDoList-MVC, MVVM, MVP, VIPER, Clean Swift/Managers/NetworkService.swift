//
//  NetworkService.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 24.03.2022.
//

// MARK: - NetworkableProtocol
protocol NetworkableProtocol {
    func requestData() -> [ArhitectureModel]
}

// MARK: - NetworkManager
final class NetworkManager {
    
}

// MARK: - NetworkableProtocol Impl
extension NetworkManager: NetworkableProtocol {
    
    func requestData() -> [ArhitectureModel] {
        let result = [
            ArhitectureModel(id: 1, name: "MVP"),
            ArhitectureModel(id: 2, name: "MVVM"),
            ArhitectureModel(id: 3, name: "VIPER"),
            ArhitectureModel(id: 4, name: "Clean Swift")
        ]
        return result
    }
}
