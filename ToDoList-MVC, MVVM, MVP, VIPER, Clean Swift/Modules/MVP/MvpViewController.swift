//
//  ViewControllerMvp.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 25.03.2022.
//

import Foundation
import UIKit

// MARK: - MVPViewProtocol
protocol MVPViewProtocol {
    
}

// MARK: - MVPViewController
final class MvpViewController: UIViewController {
    
    
    // MARK: - IBOutlet
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        let mvpNib = UINib(nibName: "MvpTableViewCell", bundle: nil)
        tableView.register(mvpNib, forCellReuseIdentifier: "MvpTableViewCell")
        return tableView
    }()
    
    // MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        
    }
    
    // MARK: - IBAction

}

// MARK: - Private methods
private extension MvpViewController {
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    func setupNavigationBar() {
        title = "MVP"
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
}

// MARK: - MVPViewProtocol Impl
extension MvpViewController: MVPViewProtocol {
    
}

// MARK: - UITableViewDataSource
extension MvpViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MvpTableViewCell", for: indexPath) as! MvpTableViewCell
        cell.titleLabel.text = "задача 1"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MvpViewController: UITableViewDelegate {
    
}
