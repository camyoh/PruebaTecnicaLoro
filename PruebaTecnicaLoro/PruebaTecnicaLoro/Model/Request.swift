//
//  Request.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/24/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation
import Firebase

struct Request {
    var post = Post()
    var ref = Database.database().reference()
    var databaseHandle:DatabaseHandle?
    
//    mutating func getPosts (){
//        databaseHandle = ref.child("posts").observe(.childAdded) { (snapshot) in
//            let snapshotValue = snapshot.value as! [String: AnyObject]
//            self.post.post = snapshotValue["post"] as? String
//            self.post.foto = snapshotValue["foto"] as? String
//            self.post.usuario = snapshotValue["usuario"] as? String
//            self.posts.append(self.post)
//        }
//    }
    
}
