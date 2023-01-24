//
//  HomeView.swift
//  studyViewCode
//
//  Created by Bruna Martins on 19/01/23.
//

import UIKit

class HomeViewScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .red
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has no been implemented")
    }

    public func setupTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    public func reloadTableView() {
        self.tableView.reloadData()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
}
