//
//  UserViewController.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/22/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func logOutTapped(_ sender: UIButton) {
        transitionToLogin()
    }
    
    func transitionToLogin () {
        let loginViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? ViewController
        view.window?.rootViewController = loginViewController
        view.window?.makeKeyAndVisible()
    }
    
}
