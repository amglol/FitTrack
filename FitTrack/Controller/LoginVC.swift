//
//  LoginVC.swift
//  FitTrack
//
//  Created by Adrian Galecki on 6/28/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }
}

extension LoginVC {
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        //verify we have text for email and password
        guard let email = emailTxtField.text, let password = passwordTxtField.text else { return }
        //attempt to login
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorLabel.text = error.localizedDescription
                self.errorLabel.isHidden = false
                print("Error: \(error)")
            }
            else {
                //navigate to main app screen
                self.performSegue(withIdentifier: "loginSuccess", sender: self)
            }
        }
    }
}
