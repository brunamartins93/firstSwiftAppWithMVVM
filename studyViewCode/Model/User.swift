//
//  User.swift
//  studyViewCode
//
//  Created by Bruna Martins on 18/01/23.
//

import Foundation
import UIKit

struct UserResult: Codable {
    var group: [User]
}

struct User: Codable {
    var id: Int
    var name: String
    var age: Int
    var profession: String
    var salary: String
    var imageUser: String
    var isEnableHeart: Bool
}
