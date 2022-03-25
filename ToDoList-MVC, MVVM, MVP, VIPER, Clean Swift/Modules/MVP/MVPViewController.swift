//
//  ViewControllerMvp.swift
//  ToDoList-MVC, MVVM, MVP, VIPER, Clean Swift
//
//  Created by Зоригто Бадмаин on 25.03.2022.
//

import UIKit

// MARK: - MVPViewProtocol
protocol MVPViewProtocol {
    
}

// MARK: - MVPViewController
final class MvpViewController: UIViewController {
    
    
    // MARK: - IBOutlet
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var backBarItem: UIBarButtonItem!
    @IBOutlet weak var addBarItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        return navBar
    }()
    
    // MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - IBAction
    @IBAction func closeMvpView(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        
    }
}

// MARK: - Private methods
private extension MvpViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let mvpNib = UINib(nibName: "MvpTableViewCell", bundle: nil)
        tableView.register(mvpNib, forCellReuseIdentifier: "MvpTableViewCell")
        
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
