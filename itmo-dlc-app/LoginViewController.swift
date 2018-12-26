//
//  LoginViewController.swift
//  itmo-dlc-app
//
//  Created by Pomavau on 26.12.2018.
//  Copyright © 2018 Andrei Vlasov. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController
{
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var tempLastLogin: UILabel!
    @IBOutlet weak var tempLastPassword: UILabel!
    
    @IBAction func loginButtonClick(_ sender: Any) {
        UserDefaults.standard.set(loginTextField.text, forKey: "login")
        UserDefaults.standard.set(passwordTextField.text, forKey: "password")
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        if let login = UserDefaults.standard.string(forKey: "login")
        {
            tempLastLogin.text = login
        }
        
        if let password = UserDefaults.standard.string(forKey: "password")
        {
            tempLastPassword.text = password
        }
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}
