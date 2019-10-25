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
    var user = User()
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    
    var posts: [Post] = []
    let ref = Database.database().reference(withPath: "posts")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserImage()
        getPostData()
    }
    
    func getPostData() {
        ref.queryOrdered(byChild: "posts").observe(.value) { (snapshot) in
            var newItems: [Post] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let post = Post(snapshot: snapshot) {
                    newItems.append(post)
                }
            }
            self.posts = newItems
            self.postsTableView.reloadData()
        }
    }
    
    func loadUserImage(){
        user.getUserData()
        if let photoUrl = user.photoUrl {
            userImage.downloadImage(from: photoUrl)
        }
    }
}

extension ContentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostItem") as! PostCellTableViewCell
        cell.fillCell(with: post)
        return cell
    }
}
