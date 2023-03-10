//
//  ViewController.swift
//  studyViewCode
//
//  Created by Bruna Martins on 18/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel: ViewModel = ViewModel()
    
    var screen: HomeViewScreen?
    
    override func loadView() {
        self.screen = HomeViewScreen()
        self.view = screen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate(delegate: self)
        self.viewModel.fetchAllRequest()
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        cell?.setupCell(user: self.viewModel.loadCurrentUser(indexPath: indexPath))
        cell?.delegate(delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.viewModel.getName(indexPath: indexPath))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }
}

extension HomeViewController: CustomTableViewCellDelegate {
    func tappedHeartButtom(_ user: User) {
        self.viewModel.changeHeartState(user)
    }
    
    
}

extension HomeViewController: ViewModelDelegate {
    func successRequest() {
        self.screen?.setupTableViewProtocols(delegate: self, dataSource: self)
        self.screen?.reloadTableView()
    }
    
    func errorRequest() {
        print("Error to call request url")
    }
    
    
}
