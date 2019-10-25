//
//  PostViewController.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/23/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var publicarButton: UIBarButtonItem!
    
    var user = User()
    let ref = Database.database().reference(withPath: "posts")
    var newPosition = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserImage()
        getPositionForTheNewPost()
        self.postTextView.delegate = self
    }
    
    @IBAction func cancerlarTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
        
    
    func loadUserImage(){
        user.getUserData()
        if let photoUrl = user.photoUrl {
            userImage.downloadImage(from: photoUrl)
        }
        if let userName = user.email {
            userNameLabel.text = userName
        }
    }
    
    @IBAction func publicarTapped(_ sender: Any) {
        addingNewPost()
        transitionToContent()
    }
    
    func getPositionForTheNewPost (){
        ref.queryOrdered(byChild: "posts").observe(.value) { (snapshot) in
            var newItems: [Post] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let post = Post(snapshot: snapshot) {
                    newItems.append(post)
                }
            }
            self.newPosition = String(newItems.count)
        }
        
    }
    
    func addingNewPost() {
        let post = Post(foto: user.photoUrl!.absoluteString, post: postTextView.text, usuario: user.email!)
        let postRef = self.ref.child(newPosition)
        postRef.setValue(post.toAnyObject())
    }
   
    func transitionToContent () {
        let contentViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.contentViewController) as? ContentViewController
        view.window?.rootViewController = contentViewController
        view.window?.makeKeyAndVisible()
    }
    
}

extension PostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        postTextView.text = ""
        postTextView.textColor = #colorLiteral(red: 0.07841805369, green: 0.07843922824, blue: 0.07841510326, alpha: 1)
    }
    func textViewDidChange(_ textView: UITextView) {
        if postTextView.text == "" {
            publicarButton.isEnabled = false
        } else {
            publicarButton.isEnabled = true
        }
    }
}
