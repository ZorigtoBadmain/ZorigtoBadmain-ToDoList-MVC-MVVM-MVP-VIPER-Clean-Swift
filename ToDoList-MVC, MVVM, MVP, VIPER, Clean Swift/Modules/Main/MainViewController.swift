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
    
    private var arhitectureModel: [ArhitectureModel] = []
    var presenter: MainPresenterProtocol?
    private var networkService: NetworkableProtocol?

    // MARK: - LiаeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        presenter?.loadData()
        
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arhitectureModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arhitectureModel[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
}

// MARK: - Private methods
private extension MainViewController {
    func setupViewController() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        view.backgroundColor = .systemPink
    }
}

// MARK: - MainViewProtocol Impl
extension MainViewController: MainViewProtocol {
    func display(_ viewModel: [ArhitectureModel]) {
        self.arhitectureModel = viewModel
        tableView.reloadData()
    }
}
