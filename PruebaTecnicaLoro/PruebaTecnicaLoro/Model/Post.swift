//
//  File.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/23/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation

struct Comentario: Codable {
    let comentario: String?
    let usuario: String?
}

struct Post: Codable {
    let post: String?
    let usuario: String?
    let foto: String?
    let comentarios: [Comentario]
}
