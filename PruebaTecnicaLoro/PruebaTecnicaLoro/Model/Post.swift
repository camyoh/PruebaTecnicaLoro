//
//  File.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/23/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Comentario {
    var comentario: String?
    var usuario: String?
}

struct Post {
    let ref: DatabaseReference?
    let foto: String
    let post: String
    let usuario: String
    
    
    init (foto: String, post: String, usuario: String) {
        self.ref = nil
        self.foto = foto
        self.post = post
        self.usuario = usuario
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:AnyObject],
            let foto = value["foto"] as? String,
            let post = value["post"] as? String,
            let usuario = value["usuario"] as? String else {
            return nil
        }
        self.ref = snapshot.ref
        self.foto = foto
        self.post = post
        self.usuario = usuario
    }
    
    func toAnyObject() -> Any {
        return [
            "foto": foto,
            "post": post,
            "usuario": usuario
        ]
    }
}

