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
    
    var posts = [Post]()
    var ref = Database.database().reference()
    var databaseHandle:DatabaseHandle?
    //    lazy var posts = Firestore.firestore().collection("posts")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //leer datos
        //        let ref = Database.database().reference()
        //        ref.child("posts/0/post").setValue("cambiando el post")
        
        //        let ref = Database.database().reference()
        //        ref.child("posts").observeSingleEvent(of: .value) { (snapshot) in
        //            let posts = snapshot.value
        //            print(posts)
        //    }
        getPosts()
        
    }
    
    func getPosts (){
        databaseHandle = ref.child("posts").observe(.childAdded) { (snapshot) in
            if let post = snapshot.value as? [String:String] {
                print(post)
            }
        }
    }
}
