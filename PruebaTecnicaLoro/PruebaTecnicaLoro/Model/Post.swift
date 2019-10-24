//
//  File.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/23/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation

struct Comentario {
    let comentario: String?
    let usuario: String?
}

struct Post {
    let post: String?
    let usuario: String?
    let photoUrl: URL?
    let comentarios: [Comentario]
}
