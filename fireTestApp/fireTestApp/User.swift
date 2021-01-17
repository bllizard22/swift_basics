//
//  User.swift
//  fireTestApp
//
//  Created by Nikolay Kryuchkov on 16.01.2021.
//

import Foundation
import Firebase

struct UserStruct {
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
