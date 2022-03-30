//
//  ArchitectureType.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 30.03.2022.
//

enum ArchitectureType {
    case mvp
    case mvvm
    case viper
    case cleanSwift
    
    var name: String {
        switch self {
        case .mvp:
            return "MVP"
        case .mvvm:
            return "MVVM"
        case .viper:
            return "VIPER"
        case .cleanSwift:
            return "Clean Swift"
        }
    }
}
