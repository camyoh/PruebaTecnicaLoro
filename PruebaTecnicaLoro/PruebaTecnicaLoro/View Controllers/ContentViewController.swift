//
//  ContentViewController.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/22/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ContentViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //leer datos
//        let ref = Database.database().reference()
//        ref.child("posts/0/post").setValue("cambiando el post")

        let ref = Database.database().reference()
        ref.child("posts").observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot.value)
        }
        
    }
    
}
