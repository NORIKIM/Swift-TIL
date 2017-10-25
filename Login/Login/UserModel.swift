//
//  UserModel.swift
//  Login
//
//  Created by 김지나 on 2017. 9. 27..
//  Copyright © 2017년 김지나. All rights reserved.
//

import Foundation

final class UserModel {
    
    var model: [user] = [
        user.init(username: "FC1", password: "1234"),
        user(username: "FC2", password: "5678"),
        user(username: "FC3", password: "9101")
    ]
    struct user {
        var username: String
        var password: String
    }
    func findUser(name: String, password: String) -> Bool {
        
        for user in model {
            if user.username == name && user.password == password {
                return true
            }
        }
        return false
}
    func addUser(name: String, password: String) {
        let newUser = user(username: name, password: password)
        model.append(newUser)
    }

}
