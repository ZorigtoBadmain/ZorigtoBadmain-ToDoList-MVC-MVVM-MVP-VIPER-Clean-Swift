//
//  Route.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 26.03.2022.
//

// MARK: - RouteProtocol
protocol RouteProtocol: AnyObject {
    func routeToMvp(from vc: MVPViewProtocol)
}

// MARK: - Route
class Route {
    
}

// MARK: - RouteProtocol Impl
extension Route: RouteProtocol {
    func routeToMvp(from vc: MVPViewProtocol) {
        let mvpViewController = MvpViewController()
        if let viewController = vc as? MvpViewController {
            viewController.present(mvpViewController, animated: true, completion: nil)
        }
        
        
    }
    
    
}
