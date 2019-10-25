//
//  PostCellTableViewCell.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/24/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailUserLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    func fillCell (with post: Post) {
        postLabel.text = post.post
        emailUserLabel.text = post.usuario
        profileImage.downloadImage(from: URL(string: post.foto)!)
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
    }

}
