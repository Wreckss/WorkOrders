//
//  User.swift
//  WorkOrders
//
//  Created by taco on 8/13/20.
//  Copyright © 2020 Wrecks. All rights reserved.
//

import Foundation

struct User {
    let username: String
    let password: String
}

class Users: ObservableObject {
    @Published var users = [User]()
}

