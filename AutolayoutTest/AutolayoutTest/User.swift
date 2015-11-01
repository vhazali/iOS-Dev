//
//  User.swift
//  AutolayoutTest
//
//  Created by Victor Hazali on 28/10/15.
//  Copyright © 2015 Victor Hazali. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let company: String
    let login: String
    let password: String
    
    static func login (login: String, password: String) -> User? {
        if let user = database[login] {
            if user.password == password {
                return user
            }
        }
        return nil
    }
    
    static let database: Dictionary <String, User> = {
        var theDatabase = Dictionary<String, User>()
        for user in
    }
}