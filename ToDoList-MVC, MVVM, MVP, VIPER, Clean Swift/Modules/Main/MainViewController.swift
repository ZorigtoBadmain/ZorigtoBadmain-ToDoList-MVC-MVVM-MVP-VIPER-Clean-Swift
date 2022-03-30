//
//  MainViewController.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 24.03.2022.
//

import UIKit

// MARK: - MainViewProtocol
protocol MainViewProtocol: AnyObject {
    func display(_ viewModel: [ArhitectureModel])
    func routeTo(_ viewController: UIViewController)
}

// MARK: - MainViewController
final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var arhitectures: [ArhitectureModel] = []
    
    var presenter: MainPresenterProtocol?

    // MARK: - LiаeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        
    }
}

// MARK: - MainViewProtocol Impl
extension MainViewController: MainViewProtocol {
    func display(_ viewModel: [ArhitectureModel]) {
        self.arhitectures = viewModel
        tableView.reloadData()
    }
    
    func routeTo(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arhitectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arhitectures[indexPath.row].type.name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.fetchArchitecture(by: indexPath.row)
    }
}

// MARK: - Private methods
private extension MainViewController {
    func setupViewController() {
        title = "Архитектуры"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        presenter?.fetchArchitectures()
    }
}

