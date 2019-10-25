//
//  ViewController.swift
//  PruebaTecnicaLoro
//
//  Created by Multimedia-7 on 10/22/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanError()
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        if let error = validateFields() {
            showError(with: error)
        } else {
            login()
        }
        
    }
    
    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespaces) == ""  || passwordTextField.text?.trimmingCharacters(in: .whitespaces) == "" {
            return "Por favor completa los campos."
        }
        return nil
    }
    
    func showError (with message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func cleanError () {
        errorLabel.alpha = 0
    }
    
    func transitionToHome () {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func login(){
        let email = emailTextField.text!
        let password = passwordTextField.text!
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.showError(with: error!.localizedDescription)
            } else {
                self.transitionToHome()
                self.cleanError()
            }
        }
    }
    
}

