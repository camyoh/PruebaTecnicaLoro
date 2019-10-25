//
//  PostViewController.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/23/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var publicarButton: UIBarButtonItem!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserImage()
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
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
