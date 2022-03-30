//
//  NetworkService.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 24.03.2022.
//

// MARK: - NetworkableProtocol
protocol NetworkableProtocol {
    func request(complition: @escaping (Result<[ArhitectureModel], Error>) -> Void)
}

// MARK: - NetworkManager
final class NetworkManager {
    private let successResponse = [
     ArhitectureModel(id: 1, type: .mvp),
     ArhitectureModel(id: 2, type: .mvvm),
     ArhitectureModel(id: 3, type: .viper),
     ArhitectureModel(id: 4, type: .cleanSwift)
     ]
}

// MARK: - NetworkableProtocol Impl
extension NetworkManager: NetworkableProtocol {
    
    func request(complition: @escaping (Result<[ArhitectureModel], Error>) -> Void) {
        complition(.success(successResponse))
    }
}
