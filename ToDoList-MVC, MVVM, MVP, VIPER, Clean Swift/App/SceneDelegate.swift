//
//  SceneDelegate.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 24.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupRootViewController(with: windowScene)
    }
}

// MARK: - Private methods
private extension SceneDelegate {
    
    func setupRootViewController(with windowScene: UIWindowScene) {
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        let moduleBuilder = ModuleBuilderManager()
        window?.rootViewController = moduleBuilder.setupMainViewController()
        window?.makeKeyAndVisible()
    }
}
