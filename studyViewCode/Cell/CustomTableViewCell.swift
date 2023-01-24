//
//  CustomTableViewCell.swift
//  studyViewCode
//
//  Created by Bruna Martins on 19/01/23.
//

import Foundation
import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func tappedHeartButtom(_ user: User)
}

class CustomTableViewCell: UITableViewCell {
    
    var viewModel: CustomCellViewModel?
    
    var screen: CustomTableViewCellScreen = CustomTableViewCellScreen()
    
    private weak var delegate: CustomTableViewCellDelegate?
    
    public func delegate(delegate: CustomTableViewCellDelegate?) {
        self.delegate = delegate
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.screen.heartButton.addTarget(self, action: #selector(self.tappedHeartButton), for: .touchUpInside)
        self.contentView.addSubview(self.screen)
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has no been implemented")
    }
    
    @objc func tappedHeartButton() {
        guard let _viewModel = viewModel else {
            return
        }

        if _viewModel.getIsEnableHeart {
            self.screen.heartButton.tintColor = .blue
            _viewModel.changeHeart(false)
        } else {
            self.screen.heartButton.tintColor = .red
            _viewModel.changeHeart(true)
        }
        
        self.delegate?.tappedHeartButtom(_viewModel.getUser)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
    
    func setupCell(user: User) {
        self.viewModel = CustomCellViewModel(data: user)
        
        self.screen.userImageView.image = UIImage(systemName: self.viewModel?.getUserImage ?? "")
        self.screen.nameLabel.text = self.viewModel?.getName
        self.screen.professionLabel.text = self.viewModel?.getProfession
        self.screen.salaryLabel.text = self.viewModel?.getSalary
        self.screen.ageLabel.text = self.viewModel?.getAge
        
        if self.viewModel?.getIsEnableHeart ?? false {
            self.screen.heartButton.tintColor = .red
        } else {
            self.screen.heartButton.tintColor = .blue
        }
    }

}
