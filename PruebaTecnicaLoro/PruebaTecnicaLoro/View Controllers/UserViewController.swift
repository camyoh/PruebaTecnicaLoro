//
//  UserViewController.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/22/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit
import Firebase

class UserViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
        configUserImage()
    }
    
    @IBAction func logOutTapped(_ sender: UIButton) {
        transitionToLogin()
    }
    
    func transitionToLogin () {
        let loginViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? ViewController
        view.window?.rootViewController = loginViewController
        view.window?.makeKeyAndVisible()
    }
    
    func configUserImage() {
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
    }

    func loadUserInfo(){
        user.getUserData()
        if let email = user.email {
            emailLabel.text = email
        }
        if let photoUrl = user.photoUrl {
            userImage.downloadImage(from: photoUrl)
            userImage.backgroundColor = .clear
        }
    }
    
}

extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        getData(from: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
            
        }
    }
}
