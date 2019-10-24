//
//  User.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/23/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation
import Firebase

struct User {
    private(set) var email: String?
    private(set) var photoUrl: URL?
    
    mutating func getUserData () {
        let user = Auth.auth().currentUser
        if let user = user {
            self.email = user.email
            self.photoUrl = user.photoURL
        }
    }
}
